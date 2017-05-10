%% Hipocikloida sa 5 siljaka

%% Inicijalizacija

clear all
close all
clc

%%

% t = 0:.1:3*pi/2;
alfa = 0:.1:2*pi;
a = 50; % poluprecnik
k = 5;
x = a*(k-1)*cos(alfa)+a*cos((k-1)*alfa)+250;
y = a*(k-1)*sin(alfa)-a*sin((k-1)*alfa)+250;
figure
title('Hipocikloida 5')
line(x,y)
