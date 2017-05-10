%% Epicikloida 2

%% Inicijalizacija

close all
clear all
clc

%%

alfa = 0:0.01:100*pi;
a = 100;
k = 3;
x = a*(k+1)*cos(alfa)-a*cos((k+1)*alfa);
y = a*(k+1)*sin(alfa)-a*sin((k+1)*alfa);

figure
plot(x,y)
title('Epicikloida 3')