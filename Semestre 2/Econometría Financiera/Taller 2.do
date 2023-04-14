import excel "C:\Users\NIGOJ\OneDrive\Desktop\NICO\MAF\Semestre 2\Econometría Financiera\DATOS TALLER 2 DE REGRES MULT  Y SERIES DE TIEMPO 2023-1 B.xlsx", sheet("PUNTO I") firstrow

reg SALARIO EDUCACIÓN EXPLAB GENERO EDAD

pwcorr EDUCACIÓN EXPLAB GENERO EDAD

estat vif

reg SALARIO EDUCACIÓN
// Se rechaza H0, por ende, al menos 1 de las variables especificadas es significativa.

// A continuación, eliminamos del modelo orignal la variable con mayor valor-p, es decir, EDAD.

reg SALARIO EDUCACIÓN EXPLAB GENERO
predict resid1, residuals
tsset EMPLEADO

estat imtest, white
estat dwatson	
estat bgodfrey
sktest resid1 
swilk resid1
// Se rechaza normalidad.

//Dummies
predict rstan1, rstandard
gen outliers = abs(rstan1)-2.5

gen d44 = 0
gen d50 = 0
gen d58 = 0

replace d44 = 1 in 44
replace d50 = 1 in 50
replace d58 = 1 in 58

reg SALARIO EDUCACIÓN EXPLAB GENERO d44 d50 d58
predict resid2, residuals
estat imtest, white
estat dwatson	
estat bgodfrey
sktest resid2
swilk resid2
// Se rechaza Homocedasticidad.

//LOG-LIN
gen LnSalario = ln(SALARIO)
reg LnSalario EDUCACIÓN EXPLAB GENERO d44 d50 d58
predict resid_loglin, residuals
estat imtest, white
estat dwatson	
estat bgodfrey
sktest resid_loglin
swilk resid_loglin
// Se validan todos los supuestos MELI.


//SQRT
gen SQRT_Salario = sqrt(SALARIO)
gen SQRT_Educacion = sqrt(EDUCACIÓN)
gen SQRT_Explab = sqrt(EXPLAB)
reg SQRT_Salario SQRT_Educacion SQRT_Explab GENERO d44 d50 d58
predict resid_SQRT, residuals
estat imtest, white
estat dwatson	
estat bgodfrey
sktest resid_SQRT
swilk resid_SQRT
// Se validan todos los supuestos MELI.

reg LnSalario EDUCACIÓN EXPLAB GENERO d44 d50 d58
predict pron_loglin, xb

reg SQRT_Salario SQRT_Educacion SQRT_Explab GENERO d44 d50 d58
predict pron_sqrt, xb

gen pron_y_loglin = exp(pron_loglin)
gen pron_y_sqrt = pron_sqrt*pron_sqrt

pwcorr SALARIO pron_y_loglin pron_y_sqrt
// El modelo de Raiz cuadrada es el que mejor ajusta sus pronósticos a los datos reales de Y (Salario).





