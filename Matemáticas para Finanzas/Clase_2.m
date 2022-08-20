%% Clase 2
%Sistemas de Ecuaciones Lineales (SEL)
A=[3 -2 3;4 -3 1;1 5 -6]; %Matriz de Variables
B=[2;-1;5]; %Términos Independientes
AB=[A B]; %Matriz Ampliada
rA = rank(A); %Rango de la Matriz
rAB = rank(AB); 
X = A\B; %Encuentra la solución del sistema
%Para el taller debo introducir la matriz, encontrar los rangos y la
%solución.
M=rref(AB); %Me da la solución del sistema ampliado en forma de matriz.

%%
%Matriz co Infinitas Soluciones
A1=[1 -1 3;2 -1 -1;3 -2 2];
B1=[4;6;10];
A1B1 = [A1 B1];
rA1 = rank(A1);
rA1B1 = rank(A1B1);
M1 = rref(A1B1); %Es visible que el sistema tiene infinitas soluciones.
%Utilizar X1 = A1\B1 da un resultado aproximado que no es confiable puesto que la
%matriz A1 tiene infinitas soluciones.

%%
%Para resolver el sistema usando el comando 'solve':
syms x y z; %Declaro que existen las variables 'x', 'y' & 'z'.
[x, y]=solve(x-y+3*z==4,2*x-y-z==6,3*x-2*y+2*z==10,[x y]); %Representación del sistema.

%%
%Gráfico de la curva de Oferta y Demanda
q=0:0.1:6; %Declaro el dominio del gráfico y la precision (0.1).
p1=3.*q+1; %Establezco la función de la curva de Oferta
plot(q,p1,'b') %La gráfico teniendo en cuenta el dominio (q) y en color azul ('b').
hold on %Le digo al programa que quiero graficar otra función en el mismo gráfico
p2=11-2.*q; 
plot(q,p2,'r') 
grid; %Le pone cuadrícula
xlabel('Cantidades (Q)') %Nombre del Eje X
ylabel('Precio (P)') %Nombre del Eje Y
title('Curva de Oferta y Demanda') %Título del gráfico
legend('O', 'D') %Leyendas el gráfico
hold off
%Para dibujar una función a trozos se definen diferentes dominios para cada
%función y se va remplazando cada vez que utilice el comando 'plot'.

%%
%Utilizando el comando 'ezplot':
%syms w
%f=2*w;
%ezplot(f, -2, 4) %Intervalo en el que quiero graficar: -2 y 4.
%grid
%Utilizar cuando necesite graficar una única función. NO varias.

%%
%Función cuadrática
syms n 
f1=600 + 20*n - 0.5*n^2; 
s=solve(f1);
s_prima=solve(diff(f1)); %Muestra el óptimo