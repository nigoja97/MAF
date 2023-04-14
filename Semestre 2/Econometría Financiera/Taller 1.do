import excel "C:\Users\NIGOJ\OneDrive\Desktop\NICO\MAF\Semestre 2\Econometría Financiera\Datos Taller 1.xlsx", sheet("PUNTO IV") cellrange(A1:D71) firstrow

tsset MES

reg CostoCientos Cajas
predict resid1, rstandard //SE USA LOS RESIDUOS ESTANDARIZADOS PARA DETECTAR LA PRESENCIA DE OUTLIERS. DE RESTO SE USAN LOS RESIDUOS NORMALES.
gen outliers = abs(resid1)-2.5
estat imtest, white
estat dwatson	
estat bgodfrey
sktest resid1 
swilk resid1
// Tiene problemas de normalidad

//Se encuentran 2 outliers que se reemplazan por variables dummies en las observaciones 31 y 46	
gen d31 = 0
gen d46 = 0
replace d31 = 1 in 31
replace d46 = 1 in 46

//LIN-LIN 
reg CostoCientos Cajas d31	d46
predict resid2, residuals
estat imtest, white
estat dwatson	
estat bgodfrey
sktest resid2 
swilk resid2
//Problemas de autocorrelación de los errores

// LOG LOG
gen LnCajas = ln(Cajas)
gen LnCostoCientos = ln(CostoCientos)
reg LnCostoCientos LnCajas d31 d46
estat imtest, white
estat dwatson	
estat bgodfrey
predict resid_loglog, residuals
sktest resid_loglog
swilk resid_loglog
//Tiene problemas de autocorrelación de los erroresy de normalidad.

//LIN-LOG
reg CostoCientos LnCajas d31 d46
estat imtest, white
estat dwatson	
estat bgodfrey
predict resid_linlog, residuals
sktest resid_linlog
swilk resid_linlog
//El modelo valida todos los supuestos

//LOG-LIN
reg LnCostoCientos Cajas d31 d46
estat imtest, white
estat dwatson	
estat bgodfrey
predict resid_loglin, residuals
sktest resid_loglin
swilk resid_loglin
// Tiene problemas de autocorrelación de los errores, heterocedasticidad y normalidad.

//Recip
gen recip_CostoCientos = 1/CostoCientos
gen recip_Cajas = 1/Cajas
reg recip_CostoCientos recip_Cajas d31 d46
estat imtest, white
estat dwatson	
estat bgodfrey
predict resid_recip, residuals
sktest resid_recip
swilk resid_recip
// Tiene problemas de autocorrelación de los errores, heterocedasticidad y normalidad.

//SQRT
gen sqrt_cajas = sqrt(Cajas)
reg CostoCientos sqrt_cajas d31 d46
estat imtest, white
estat dwatson	
estat bgodfrey
predict resid_sqrt, residuals
sktest resid_sqrt
swilk resid_sqrt
//El modelo valida todos los supuestos

//Y-Squared_LOG
gen CostoCientos2 = CostoCientos*CostoCientos
reg CostoCientos2 LnCajas d31 d46
estat imtest, white
estat dwatson	
estat bgodfrey
predict resid_y2_log, residuals
sktest resid_y2_log
swilk resid_y2_log
//El modelo valida todos los supuestos

reg CostoCientos2 LnCajas d31 d46
predict pron_CostoCientos2, xb
gen pron_y_CostoCientos2=sqrt(pron_CostoCientos2)

reg CostoCientos sqrt_cajas d31 d46
predict pron_SQRT, xb

//Se comparan los 3 modelos (LIN-LOG, Y-Squared, y SQRT)
pwcorr CostoCientos pron_y_CostoCientos2 pron_SQRT
//El mejor modelo es SQRT pues es el que muestra una mayor correlación de los pronósticos con los valores reales de la función.