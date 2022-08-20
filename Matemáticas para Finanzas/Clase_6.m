%% Clase 6
%Derivadas parciales
syms x y
w=2*x^3*y+5*y^2*x+6*x*y+2*x+9*y+4;
dwx=diff(w,x);
dwy=diff(w,y);
%Otra manera de encontrar todas las segundas derivadas parciales de 2do orden de una
%funcion es con el comando hessian.
h=hessian(w);

%% Ejemplo 1
syms x1 y1
c1=0.1*x1^2+0.5*y1^2+4*x1*y1+2000;
dc1x=diff(c1, x1);
dc1y=diff(c1, y1);
hc1=hessian(c1);
%Encuentre loos costos marginales cuando se producen 500 celulares tipo
%basico (x1) y 100 del otro (y1).
c1500100=subs(dc1x,{x1, y1},{500,100});
%Interpretación: El costo de aumentar en 1 unidad los celulares tipo básico producidos
%manteniendo la producción del otro tipo de celulares constante en 100
%unidades es de 500 unidades monetarias.

%% Optimización de funciones de varias variables.
%Debo hallar las derivadas parciales de la función con respecto a cada
%variabe, igualarlas a 0 y encontrar la(s) solucion(es) del sistema de 
% ecuaciones creado. 
% Ejemplo 2
syms x2 y2
f2x2y2= x2^2+y2^2-2*x2+2*y2+2;
df2x2=diff(f2x2y2,x2);
df2y2=diff(f2x2y2,y2);
pcf2=solve(df2x2, df2y2);
%El punto crítico se encuentra en (1, -1).

%% Ejemplo 3
syms x3 y3
f3=-x3^3+4*x3*y3-2*y3^2+1;
df3x3=diff(f3,x3);
df3y3=diff(f3,y3);
pcf3=solve(df3x3, df3y3);
%El sistema tiene 2 puntos críticos (0, 0) y (4/3, 4/3).
h3=hessian(f3);
%Convexa (Mínimo global): Si los elementos de la diagonal son >0 y el det >=0
%Concava (Máximo global): Si los elementos de la diagonal son <0 y el det >=0
% **EL DETERMINANTE SIEMPRE TIENE QUE SER POSITIVO**
h300=subs(h3,0); %Todos los elementos negativos o <= 0. Pero el det es <0 NO hay Máx ni Mín.
h34343=subs(h3, 4/3); %Todos los elementos negativos o <= 0. Y el det es >0 Concava y Máximo Global.

%% Problemas de Optimización.
%Comandos para resolver los modelos: linprog (Problema 1 y 2), intlinprog (Problema 3), fmincon (Problema 4).
%[x vfX]=linprog(f, A, b, Aeq, beq, lb, ub)
%f: Función a optimizar
%A: Matriz de los coeficientes de las restricciones que están antes de la
%desigualdad. 
%b Matriz de resultados de las restricciones. Los números al otro lado de
%la desigualdad.
%Aeq, beq: Las matrices de coeficientes para las restricciones con
%IGUALDAD. 
%lb: Es un vector con tantas componentes como variables para poner las
%cotas inferiores (Dominio). 
%ub: Es un vector con tantas componentes como variables para poner las
%cotas superiores (Dominio).
%EN MATLAB MINIMIZA POR DEFECTO. SI QUIERO MAXIMIZAR UN PROBLEMA O UNA
%RESTRICCION DEBO MULTIPLICAR POR -1.

%% Problema 1
%max f=0.009x+0.05y, en matlab:
%min f=-0.09x-0.05y
%sa x<=9000, y>=3000, x+y<=15000, x>=y (rescrito como -x+y<=0), x,y>=0

f1=[-0.09 -0.05];
A1=[1 1; -1 1];
b1=[15000, 0];
lb1=[0 3000];
ub1=[9000 15000];
Aeq1=[];
beq1=[];
[X1, vfX1]=linprog(f1, A1, b1, Aeq1, beq1, lb1, ub1);
%Maximizará los beneficios cuando invierta 9000 en acciones tipo 1 y 6000
%en acciones tipo 2. Y, obtendrá un beneficio de 1110 USD.

%% Problema 2
