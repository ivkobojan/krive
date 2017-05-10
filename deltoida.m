%% Deltoida

%% Inicijalizacija

clear all
close all
clc

%%

% t = 0:.1:3*pi/2;
alfa = 0:.1:10*pi;
a = 80; % poluprecnik
k = 3;
x = a*(k-1)*cos(alfa)+a*cos((k-1)*alfa)+300;
y = a*(k-1)*sin(alfa)-a*sin((k-1)*alfa)+300;
figure
title('Deltoida')
line(x,y)
