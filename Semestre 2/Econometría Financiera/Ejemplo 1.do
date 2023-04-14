import excel "C:\Users\NIGOJ\OneDrive\Desktop\NICO\MAF\Semestre 2\Econometría Financiera\Datos Ejemplo de Regresion.xlsx", sheet("PUNTO I") firstrow
drop G H I J K L M N O P Q R S T U V W

tsset Portafolio	
reg RetornoanualY RiesgoanualX
estat imtest, white

// Como el p-value < 0,05, no se rechaza H0 de Heterocedasticidad y tenenmos problemas

estat dwatson	
estat bgodfrey
predict resid1, residuals
sktest resid1 
reg RetornoanualY RiesgoanualX d20 d26 d42

// Si tiene problemas con que las variables se hayan guardado como texto y quiere cambiarlas de formato puede usar destring 'varname', replace force.

estat imtest, white
estat bgodfrey
predict resid2, residuals
sktest resid2
predict pron_y_mod12, xb
gen LnY=ln(RetornoanualY)
gen LnX=ln(RiesgoanualX)

gen recip_Y=1/RetornoanualY
gen recip_X=1/RiesgoanualX

reg LnY LnX
estat imtest, white

reg LnY LnX d20 d26 d42
estat imtest, white
estat bgodfrey
predict resid_loglog, residuals
sktest resid_loglog
swilk resid_loglog

reg LnY RiesgoanualX
estat imtest, white

reg LnY LnX d20 d26 d42
predict pron_loglog, xb
gen pron_y_loglog=exp(pron_loglog)

reg LnY RiesgoanualX d20 d26 d42
predict pron_loglin, xb
gen pron_y_loglin=exp(pron_loglin)

reg RetornoanualY LnX
predict pron_linlog, xb
gen pron_y_linlog=exp(pron_linlog)

reg LnY RiesgoanualX d20 d26 d42
estat imtest, white

reg recip_Y recip_X
predict pron_recip_Y, xb
gen pron_y_recip=1/pron_recip_Y

// Comparo el R^2 de los modelos que validan los supuestos M.E.L.I.

pwcorr RetornoanualY pron_y_mod12 pron_y_loglog pron_y_recip




