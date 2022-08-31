%% Taller 2 

%% Punto 1
syms p1
x1 = 500*(10-p1);
x1_prima = diff(x1);
Ex1p1 = (p1*(x1_prima))/x1;

%Cuando P=2
Ex1p12=subs(Ex1p1, 2);
%Cuando P=5
Ex1p15=subs(Ex1p1, 5);
%Cuando P=6
Ex1p16=subs(Ex1p1, 6);
%La demanda de x1 disminuye 0.25% (Inelástico), 1% (Unitaria) y 1.5%  (Elástica) cuando ante una variación de 1%
%en el precio del bien x1 cuando el precio es 2, 5 y 6 respectivamente.

%% Punto 2
%Si p2+0.1x2=80 se puede reexpresar como p2=800-x2, ahora:
syms x2
p2=80-0.1*x2;
c2=5000+20*x2;
%Si la utilidad es ingresos menos costos entonces necesitamos i2
%i2=p2*x2; que lo podemos reexpresar como 
i2=p2*x2;
u2=i2-c2;
u2_prima=diff(u2);
%Cuando se producen 150 unidades, el costo marginal es de:
u2_prima150=subs(u2_prima, 150);
%Cuando se producen 400 unidades, el costo marginal es de:
u2_prima400=subs(u2_prima, 400);
%Producir una unidad de más cuando se han prpducido 150 y 400 unidades,
%genera una utilidad marginal de 30 y -20 respectivamente.

%% Punto 3
syms x3
c3=0.0001*x3^3-0.09*x3^2+20*x3+1200;
c3_prima=diff(c3);
c3_prima1=subs(c3_prima,1);
%El costo de producir una unidad de más cuando se han producido 1000
%unidades es de 19.8203 unidades monetarias.

%% Punto 4
syms x4
u4=20*x4-0.5*(x4-30)^2;
u4_prima=diff(u4);
x4_optimo=solve(u4_prima);
%la cantidad óptima son 50 turistas, por lo tanto, la cantidad optima de
%turistas adicionales es de 20.

%% Punto 5
syms p5
%u5=60*p5-p5*(60-(60-((p5-180)/5))); que se puede reescribir como:
u5=(480/5)*p5-(p5^2)/5;
u5_prima=diff(u5);
p5_optimo=solve(u5_prima);
%La renta óptima que debe cobrar el administrador es de 240$ para obtener
%una utilidad total de 11520$.

%% Punto 6
%Dado el rango de producción de [100, 600]
syms x6
i6=x6^2-6*x6+17;
ezplot(i6,-6, 12)
i6_prima=diff(i6);
pc6=solve(i6_prima); %Hallamos el punto crítico en x=3
i6_2prima=diff(i6,2); %2>0 el punto crítico es mínimo global. Y se
% encuentra dentro del rango dado. Por tanto:
i61=subs(i6, 1);
i66=subs(i6, 6);
i6_critico=subs(i6, 3);

%Los ingresos se encuentran entre [8, 17].

%% Punto 7
%Si u7=i7-c7 (Porque la utilidad es igual a los ingresos menos los costos)
%La utilidad marginal (u7') por propiedades de las derivadas es: u7'=i7'-c7' 
%Una empresa maximiza su utilidad cuando la utilidad marginal es igual a 0.
%Es decir, cuando el ingreso marginal (i7') es igual al costo marginal
%(c7').

syms A7
x7=2000*(1-exp(-0.001*A7));
i7=5*(x7);
u7=i7-A7;
u7_prima=diff(u7);
A=double(solve(u7_prima));
u7_optima=double(subs(u7, A));
%% Punto 8
syms x8
c8=5*x8;
p8=25-2*x8;
%u8=i8-c8; i8=p8*x8
i8=p8*x8; 
u8=i8-c8;
u8_prima=diff(u8); 
pc8=solve(u8_prima); %Muestra un punto critico en 5
u8_2prima=diff(u8,2); %Nos confirma que el punto crítico es máximo.
x8_optimo=pc8; 
%El nivel óptimo de producción que maximiza la utilidad de la empresa es de
%5 unidades de x.
u8_max=subs(u8, x8_optimo);
%La utilidad máxima de la empresa es de 50$
%% Punto 9
syms x9
c9=192000+2400000*x9^(-1)+0.15*x9;
c9_prima=diff(c9);
pc9=solve(c9_prima)