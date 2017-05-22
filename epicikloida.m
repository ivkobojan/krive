%% Epicikloida 2

%% Inicijalizacija

close all
clear all
clc

%%

alfa = 0:0.01:100*pi;
a = 100;

% Celo k "pravi ispupcenja"
k = 2;
% k = 3;
% k = 4;

% Realno k "pravi siljke u krugu"
% k = 2.1;
% k = 3.8;
% k = 5.5;
% k = 7.2;

x = a*(k+1)*cos(alfa)-a*cos((k+1)*alfa);
y = a*(k+1)*sin(alfa)-a*sin((k+1)*alfa);

figure
plot(x,y)
title(['Epicikloida k=', num2str(k)])