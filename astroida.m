%% Astroida

%% Inicijalizacija

clear all
close all
clc

%%

% t = 0:.1:3*pi/2; % otvorena
t = 0:.1:2*pi; % zatvorena
a = 200; % "visina"
x = a*cos(t).^3;
y = a*sin(t).^3;
figure
title('Astroida')
line(x,y)
