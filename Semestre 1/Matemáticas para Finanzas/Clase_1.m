%% Clase 1
%Introducción
%Se debe acabar cada línea con un ';'
%Creación de Matrices
A=[1.04 0 0; 0 1.06 0; 0 0 1.07];%Definición de una matríz.
B=[100; 100; 100];
size(A); %Orden de la matríz.
%Cuando no asigno una respuesta a una variable se crea una variable
%temporal llamada 'ans' que se reescribirá si introduzco una nueva
%operación sin variable.
At=A'; %Matriz Transpuesta: Utilizar el comando A'.
C1=A*B; %Multiplicación
C2=A+B; %Suma
C3=A-B; %Resta
C4=(A^2)*B; %Multiplica a la matriz por si misma.