%% Hipocikloida 7.2

%% Inicijalizacija

clear all
close all
clc

%%

% t = 0:.1:3*pi/2;
t = 0:.1:10*pi;
a = 100; % poluprecnik
k = 7.2;
x = a*(k-1)*cos(t)+a*cos((k-1)*t);
y = a*(k-1)*sin(t)-a*sin((k-1)*t);
figure
title('Hipocikloida 7.2')
line(x,y)
