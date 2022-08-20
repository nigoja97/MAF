%% Proyecto

%%  Punto 1


%% Punto 2
syms x2
u2=3*x2^3-20*x2^2+5*x2+110;
u2_prima=diff(u2);
u2_2prima=diff(u2, 2);
pc2=double(solve(u2_prima));
pi21=double(subs(u2_2prima, 0.1287));
pi22=double(subs(u2_2prima, 4.3157));