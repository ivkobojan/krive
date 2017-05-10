%% Lisazu

%% Inicijalizacija

close all
clear all
clc

%%

alfa = 0:0.01:100*pi;
a = 200;
x = a*sin(2*alfa);
y = a*cos(alfa);
X = [x; y];


figure
line(X(1,:),X(2,:),'Color','g')
