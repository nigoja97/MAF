import excel "C:\Users\NIGOJ\OneDrive\Desktop\NICO\MAF\Semestre 2\Econometría Financiera\DATOS EJEMPLO REGRESIÓN LINEAL MÚLTIPLE 2023-1 B.xls", sheet("Hoja1") cellrange(A1:H41) firstrow

reg Gasto_anual_en_Lacteos Renta_anual_Disponible Urbano ESTMED ESTSUP Proporcion TAMHOG
pwcorr Renta_anual_Disponible Urbano ESTMED ESTSUP Proporcion TAMHOG

tsset Familia

estat vif //Ningun VIF>=10. No se observan señales de multicolinealidad aproximada.

