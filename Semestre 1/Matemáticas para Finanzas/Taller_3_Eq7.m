%% Taller 3

%% Pregunta 1

%% Pregunta 5. a.

%Máx f(x,y)=0.1x+0.08y
%         s.a
% x>=130.000
% y>=60.000
% x+y<=210.000
% -x+2y<=0

f1=[-0.10 -0.08];
A1=[1 1; -1 2];
b1=[210000, 0];
lb1=[130000 60000];
ub1=[150000 80000];
Aeq1=[];
beq1=[];
[X1, vfX1]=linprog(f1, A1, b1, Aeq1, beq1, lb1, ub1);

%La distribución óptima del dinero que desea invertir es de 150.000 Euros
%en la acción de tipo A y 60.000 Euros en la acción de tipo B. De esta
%manera, el rendimiento en Euros de la inversión será de 19.800.