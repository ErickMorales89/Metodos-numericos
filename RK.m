function [acc, Y]= RK(xmin,xmax,y0,h,fnc)
% Método de Runge-Kutta de cuarto orden
% RK(xmin,xmax,y0,h,fnc)
% xmin es el valor mínimo de x
% xmax es el valor máximo de x
% y0 el valor inicial de Y
% h es incremento o paso
% fnc es la función a evaluar en string ej. '-2*x.^3+12*x.^2-20*x+8.5'

clc;
fnc1 = str2func(strcat('@(x,y)',fnc));
N = (xmax-xmin)/h;
x = xmin;
Y(1) = y0;
acc(1) = xmin;
nombre = input('Ingresa el nombre del archivo que se creara: \n','s');
nmb = strcat(nombre,'.txt');
fid = fopen(nmb,'w');
for i = 1:N
    fprintf(fid,'x = %2.2f\tY = %3.2f\r\n', acc(i), Y(i));
    k1 = fnc1(x,Y(i));
    x1 = x+(1/2)*h;
    y1 = Y(i)+(1/2)*h*k1;
    k2 = fnc1(x1,y1);
    x2 = x+(1/2)*h;
    y2 = Y(i)+(1/2)*h*k2;
    k3 = fnc1(x2,y2);
    x3 = x+h;
    y3 = Y(i)+h*k3;
    k4 = fnc1(x3,y3);
    Y(i+1) = Y(i)+((1/6)*(k1+2*k2+2*k3+k4))*h;
    x = x+h;
    acc(i+1)=x;
end
fprintf(fid,'x = %2.2f\tY = %3.2f\r\n', acc(N+1), Y(N+1));
fclose(fid);
Y=Y(:);
acc = acc(:);