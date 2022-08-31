%% Clase 7 Integrales

%% Ejemplo 1
%La curva de demanda es. ***VER MAÑANA EN EL PDF***
syms x1
d1=50-0.06*x1^2;
fd1=d1-p1_0;
q1_0=20;
p1_0=subs(d1, q1_0); %p1_0=d1(20)=50-0.06*(20^2) = 26
a1d=int(fd1, 0, q1_0) %Representa el superavit del productor.

%s1=x1^2+7;
%fs1=12-s1;
%a1s=int(fs1, 0, 10)

%% Ejemplo 2

