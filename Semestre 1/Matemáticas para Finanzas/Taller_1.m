%Taller 1

%% Parte I
%Punto 1
A=[4 3.5 4; 4 4 4.5; 3.5 4 3.5; 4 3.5 3.5; 3.5 4 4];
wQ=[0.6 0.4 0.3;0.3 0.3 0.4; 0.1 0.3 0.3];
Best_A=A*wQ;
Best_AD1=max(Best_A(:,1));
Best_AD2=max(Best_A(:,2));
Best_AD3=max(Best_A(:,3));
%El mejor aspirante para los 3 departamentos es A2.

%%
%Punto 2
T=[400 100 500; 300 200 400; 100 100 200; 200 200 300];
P=[25 50 80];
Pi=T*P';
%La ganancia de la tienda de Bogotá fue de 55.000.000, la de la tienda de
%Cali fue de 49.500.000, la de Barranquilla 23.500.000 y la de Soacha
%39.000.000.

%%
%Punto 3
Autos = [1.5 2 3; 1 1.5 2; 1 1 1];
Dinero = [250; 175; 140];
AutosDinero = [Autos Dinero];
rAutos = rank(Autos);
rAutosDinero = rank(AutosDinero);
M1 = rref(AutosDinero); 
X = Autos\Dinero;
%Se vendieron 80 Autos tipo A, 50 tipo B y 10 tipo C.

%%
%Punto 4
syms SalaA SalaB SalaC;
[SalaA, SalaB, SalaC]=solve(SalaA+2*SalaB+3*SalaC==425, SalaA+SalaB+SalaC==200, 2*SalaA+SalaB+3*SalaC==400,[SalaA SalaB SalaC]);
%A la Sala A atienden 50 personas, a la B 75 y a la C 75.

%%
%Punto 5
syms ParteA ParteB ParteC;
[ParteA, ParteB]=solve(ParteA+ParteB+ParteC==45000,0.02*ParteA+0.03*ParteB+0.05*ParteC==1100,[ParteA ParteB]);
%El ejercicio tiene infinitas soluciones matemáticas. Por ejemplo, cuando
%se invierte 0$ a 5% de interés se tiene una inversion en A y B de 25000 y
%20000 respectivamente con un retorno total de 1100. Cuando se invierte 
% 6000$ a 5% de interés se tiene una inversion en A y B de 37000 y
%2000 respectivamente con un retorno total de 1100.

%%
%Punto 6
M2 = [1 -1/4; 10 12];
M3 = [0; 42000];
M2M3=[M2 M3];
M4=rref(M2M3);
X2= M2\M3;
%El fabricante debe vender al menos 724 unidades de A y 2897 unidades de B
%para mantener la proporción.

%% Parte II
syms E H Mc;
[E, H]=solve(-E-1.5*H+0.5*Mc==-350,1.5*E+0.5*H+Mc==600,[E H]);

e=subs(E,200);
h=subs(H, 200);
%El comando subs(1,2), sustituye en la funcion 1, el valor 2.

%a. Tiene razón pues la información que tiene es de un sistema
%indeterminado.
%b. Si comprara 200 acciones de McDonalds, compraría 157 acciones de Hilton
%Hotels y 214 acciones de Eastern Airlines

%% Parte VI
syms x
y=sqrt(750-x^2-40*x)-15; %Establezco la función de la curva de Oferta
ezplot(y, -40, 40) %Intervalo en el que quiero graficar: -2 y 4.
grid

s=solve(y);
s_prima=solve(diff(y));
%La función toma su máxmimo cuando x vale -20. Lo que quiere decir que la producción
%se maximiza cuando se producen 20 unidades negativas de 'x'. Esto no es
%posible en la vida real, por lo que la opción más cercana es producir 0
%unidades de 'x' y 12 de 'y'.