%% Kardioida

%% Inicijalizacija

close all
clear all
clc

%%

alfa = 0:0.01:100*pi;
a = 150;
y = a*(1+cos(alfa)).*cos(alfa)+200;
x = a*(1+cos(alfa)).*sin(alfa)+250;

figure
plot(x,y)