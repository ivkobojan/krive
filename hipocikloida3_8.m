%% Hipocikloida 3.8

%% Inicijalizacija

clear all
close all
clc

%%

% t = 0:.1:3*pi/2;
t = 0:.1:20*pi;
a = 100; % poluprecnik
k = 3.8;
x = a*(k-1)*cos(t)+a*cos((k-1)*t);
y = a*(k-1)*sin(t)-a*sin((k-1)*t);
figure
title('Hipocikloida 3.8')
line(x,y)
