%Taller 1

%%
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
[SalaA, SalaB]=solve(SalaA+2*SalaB+3*SalaC==200,2*SalaA+SalaB+3*SalaC==400,[SalaA SalaB]);
%Tiene infinitas soluciones matemáticas pero sólo una solución aplicable a
%la vida real. Cuando asisten 0 personas a C, 200 a A y 0 a B. De otro
%modo, asistirian personas negativas a B y esto no es posible.

%%
%Punto 5
