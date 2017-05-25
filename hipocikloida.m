%% Hipocikloida

%% Inicijalizacija

clear all
close all
clc

%%

alfa = 0:.1:2*pi;
a = 50; % poluprecnik
k = 5;
% k = 2.6;
% k = 3.8;
% k = 5.5;
% k = 6;
% k = 7.2;
x = a*(k-1)*cos(alfa)+a*cos((k-1)*alfa)+250;
y = a*(k-1)*sin(alfa)-a*sin((k-1)*alfa)+250;
figure
title(['Hipocikloida k=', num2str(k)])
line(x,y)
