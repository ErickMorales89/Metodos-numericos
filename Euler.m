function [acc, Y] = Euler(a,b,y0,dx,fnc)
% Metodo de Euler Euler(a,b,y0,dx,fnc)
% a es el valor inicial de x 
% b es el valor final de x
% y0 es el valor inicial de Y
% dx es el incremento de x
% y' = fnc(x,y) fnc tiene que ser string
% regresa los valores de [x Y] y crea un archivo .txt con los valores.

clc;
fnc1 = str2func(strcat('@(x,y)',fnc));
N = (b-a)/dx;
x = a;
Y(1) = y0;
acc(1) = x;
nombre = input('Ingresa el nombre del archivo que se creara: \n','s');
nmb = strcat(nombre,'.txt');
fid = fopen(nmb,'w');
for i = 1:N
    fprintf(fid,'x = %2.2f\tY = %3.2f\r\n', acc(i), Y(i));
    x = x+dx;
    Y(i+1) = Y(i) + fnc1(x,Y(i))*dx;
    acc(i+1)= x;
end
fprintf(fid,'x = %2.2f\tY = %3.2f\r\n', acc(N+1), Y(N+1));
fclose(fid);
Y = Y(:);
acc = acc(:);