%% Proyecto

%%  Punto 1
syms A1 B1 C1 %Número de mesas tipo 1, 2 y 3.
[A1, B1]=solve(A1+B1+C1==45, 4*A1+6*B1+8*C1==240, [A1 B1]);
%El modelo tiene infinitas soluciones matemáticas.

%Si prepara 0 mesas tipo C (de 8 personas):
A1_0=subs(A1, 0);
B1_0=subs(B1, 0);
%Debe preparar 15 mesas tipo A (de 4 personas) y 30 mesas tipo B (de 6
%personas)

%Si prepara 10 mesas tipo C (de 8 personas):
A1_10=subs(A1, 10);
B1_10=subs(B1, 10);
%Debe preparar 25 mesas tipo A (de 4 personas) y 10 mesas tipo B (de 6
%personas)

%% Punto 2
syms x2 %Miles de unidades producidas del producto
u2=3*x2^3-20*x2^2+5*x2+110;
u2_prima=diff(u2);
u2_2prima=diff(u2, 2);
pc2=double(solve(u2_prima)); %Puntos críticos de la función.
pi21=double(subs(u2_2prima, 0.1287)); %Punto de inflexión fuera del rango a evaluar (Maximo local).
pi22=double(subs(u2_2prima, 4.3157)); %Punto de inflexión >0. Por tanto, mínimo local.

u2_1=subs(u2, 1)
u2_4=double(subs(u2, 4.3157))
u2_8=subs(u2, 8)

ezplot(u2, -1, 9);
%Las utilidades obtenidas de la venta semanal, cuando se producen entre 
%1000 y 8000 unidades del producto, se encuentran entre 0.2164 y 406
%unidades monetarias.

%% Punto 3
syms A3 B3 C3 %Tipos de chips en planes mensuales (A, B y C)
cA3=1000;
cB3=600;
cC3=1200;

pA3=1500;
pB3=1000;
pC3=1600;

i3=pA3*A3+pB3*B3+pC3*C3;
c3=cA3*A3+cB3*B3+cC3*C3;

u3=i3-c3; %Función a maximizar

f1=[-500 -400 -400];
A1=[1 1 1; 1000 600 1200; 0 1 -2; 1/20 1/30 1/40];
b1=[4000, 150000000, 0, 300];
lb1=[0 0 0];
ub1=[100 9000 12000];
Aeq1=[];
beq1=[];
[X1, vfX1]=linprog(f1, A1, b1, Aeq1, beq1, lb1, ub1)

%La producción óptima de chips para maximizar las ganancias de la empresa
%teniendo en cuenta las restricciones planteadas se alcanza cuando se
%producen 100 unidades del chip A y 3900 del tipo C. De esta manera la 
%utilidad total será de $1.610.000 pesos.

%% Punto 4
syms L K %Unidades de Trabajo (L) y Capital (K).
P=25*L+2*L^2-3*L^3+5*L*K^2-7*L^2*K+2*K^2-K^3;
dPL=diff(P,L);
dPK=diff(P,K);

dPL_3=subs(dPL,{L, K},{3,10}) %Utilizando 3 unidades de Trabajo (L) y
%manteniendo constante el Capital (K) en 10 unidades; Si se aumenta en 1 unidad
%el trabajo la producción aumentará en 36.

dPK_10=subs(dPK,{L, K},{3,10}) %Utilizando 10 unidades de Capital (K) y
%manteniendo constante el Trabajo (L) en 3 unidades; Si se aumenta en 1 unidad
%el capital la producción disminuye en 23.
