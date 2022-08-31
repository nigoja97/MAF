%% Clase 4
%%Derivadas
%Para encontrar el óptimo de la función se debe encontrar el punto donde la
%derivada de la función es igual a 0.

syms x
f=2*x^3-x^2-2*x;
f_prima=diff(f);
f_2prima=diff(f, 2); %El primer argumento hace referencia a la función a
%derivar, el segundo argumento al grado de derivada que quiero hacer.

%%
syms x
C=0.001*x^3-0.3*x^2+40*x+1000; %Ecuación de costos
C_prima=diff(C);
C_prima50=double(subs(C_prima,50)); %El comando double == 'float'
C_prima100=double(subs(C_prima,100));
C_prima150=double(subs(C_prima,150));

%d=-20:0.1:20; 
%plot(d,C,'b') 
%hold on
%plot(d,C_prima,'r') 
%grid;
%hold off

%%
syms p
Q=8000*p^(-1.5);
Q_prima=diff(Q);
EQ_p=double(p*Q_prima/Q);

%Para determinar la elasticidad de la demanda se debe halla el valor
%absoluto. Si el abs es >1 es elástico, de lo contrario es inelástico. El
%signo determina la dirección de la elasticidad, si aumenta o disminuye la
%demanda.

%%
syms x1
f1=(1/3)*x1^3+(3/2)*x1^2-4*x1;
f1_prima=diff(f1);
s1=solve(f1_prima);
ezplot(f1, -6, 6);
%Si la segunda derivada evaluada en un punto óptimo es negativa quiere 
% decir que dicho punto es máximo, si es positiva positiva es un mínimo. Si
% es 0 tengo que seguir derivando hasta que me de distinto de 0. Si el
% orden de dicha derivada es impar ahi no hay nada, ni maximo ni minimo. Si
% es par se toman las condiciones de la segunda derivada.
f1_2prima=diff(f1, 2);
mm1=subs(f1_2prima,-4); %mm1=-5<0 por lo tanto es Máxmio
mm2=subs(f1_2prima, 1); %mm2=5>0 por lo tanto es Mínimo
%%
syms x2
f2=4*x2^3+5*x2^2+8*x2+4;
f2_prima=diff(f2);
f2_2prima=diff(f2,2);

%%
%Optimizaación de una variable con restricciones
%Pasos:
%1. Hallar puntos críticos (cuando la primera derivada vale 0)
%2. Seleccionar de los puntos críticos hallados, los que se encuentran en
%el intervalo de la restricción.
%3. Evaluar la función en los puntos críticos que se encuentren en el
%intervalo y en los extremos del mismo.

%Ejemplo 1: Para la función f3 en el intervalo [1 , 6]
syms x3
f3=1/3*x3^3-7/2*x3^2+10*x3;
f3_prima=diff(f3);
s3=double(solve(f3_prima)); %Los puntos críticos son 2 y 5.
f3_1=double(subs(f3,1));
f3_2=double(subs(f3,2));
f3_5=double(subs(f3,5));
f3_6=double(subs(f3,6));