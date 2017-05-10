%% Astroida

%% Inicijalizacija

clear all
close all
clc

%%

% t = 0:.1:3*pi/2;
t = 0:.1:2*pi;
a = 200;
x = a*cos(t).^3;
y = a*sin(t).^3;
figure
title('Astroida')
line(x,y)
