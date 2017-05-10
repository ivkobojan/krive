% testiranje generisanja razlicitih odbiraka na osnovu knjige Combining
% Pattern Classifiers, Methods and Algorithms, Kucheva

%% Inicijalizacija
close all
clear all
clc

%%

T = 1000;
s = 0.005; % sigma^2 for class omega_1
DataSet = [];

for i=1:T
    if rand<0.6
        % Generate a point from class omega_1
        % First, generate a point on the curve
        t=(rand-0.5)*2*pi; % pick t in [-pi,pi]
        x=sin(2*t);y=cos(t);
        % Superimpose a normal distribution
        flag=0; % we don't have the noise coordinates yet
        while flag==0
            u=(rand-0.5)*6*sqrt(s);
            v=(rand-0.5)*6*sqrt(s);
            w=rand;
            if w<((1/(2*pi*s))*exp(-(u^2+v^2)/(2*s)))
                flag=1;
                % u and v are sitable noise coordinates
            end % if w
        end % while
        DataSet=[DataSet;x+u,y+v]; % Add to the data set
        Labels(i)=1; % Store the label
    else
        % Generate a point from class omega_2
        % First, generate a point on the curve
        t=-0.3+rand*1.8; % pick t in [-0.3 1.5]
        x=t; y=1.4*t-1.5;
        s1=0.01*(1.5-x)^2;s2=0.001; % variances
        % Superimpose a normal distribution
        flag=0; % we don't have the noise coordinates yet
        while flag == 0
            u=(rand-0.5)*6*sqrt(s2);
            v=(rand-0.5)*6*sqrt(s1);
            w=rand;
            if w<((1/(2*pi*sqrt(s1*s2)))*exp(-(u^2/s2+v^2/s1)/2))
                flag=1;
                % u and v are suitable noise coordinates
            end % if w
        end % while
        DataSet=[DataSet;x+u,y+v]; % Add to the data set
        Labels(i)=2; % Store the label
    end % if rand
end % for i

w1=[];
w2=[];
for i=1:T
    if Labels(i)==1
        w1=[w1 [DataSet(i,1);DataSet(i,2)]];
    else
        w2=[w2 [DataSet(i,1);DataSet(i,2)]];
    end
end
    
figure
hold on
plot(w1(1,:),w1(2,:),'+','Color',[0 .7 0])
plot(w2(1,:),w2(2,:),'b*')
hold off

t=-pi-1:0.1:pi;
x=sin(2*t);y=cos(t);
X1=[x; y];

t=-0.3:0.1:1.5;
x=t; y=1.4*t-1.5;
X2=[x; y];

figure
hold on
line(X1(1,:),X1(2,:),'Color','g')
line(X2(1,:),X2(2,:),'Color','b')
hold off

% hiperbola
t = -pi:0.1:pi; a = 2; b = 3;
x = a*sec(t); % + pomera u desno (kasni)
y = b*tan(t);
figure
title('Hiperbola')
line(x,y)

% kvadratna?
t = -1:0.1:.5;
x = sin(t)+5; % + pomera u desno (kasni)
y = cos(t)+5; % + pomera na gore
figure
title('Kvadratna?')
line(x,y)

% parabola
t = -5:0.1:5;
x = t;
y = t.^2;
figure
title('Parabola')
line(x,y)

% krug
t = -5:0.1:5; a = 1;
x = a*cos(t);
y = a*sin(t);
figure
title('Krug')
line(x,y)

% elipsa
t = -5:0.1:5; a = 1; b = 5;
x = a*cos(t);
y = b*sin(t);
figure
title('Elipsa')
line(x,y)

% parametarska jednacina desne grane hiperbole
fi = -pi:0.1:pi; a = 1; b = 5;
x = +a*cosh(fi); % moze i sa -
y = b*sinh(fi);
figure
title('parametarska jednacina desne grane hiperbole');
line(x,y)

% astroida
% t = 0:.1:3*pi/2;
t = -pi:.1:pi;
a = 5;
x = a*cos(t).^3+5;
y = a*sin(t).^3;
figure
title('Astroida')
line(x,y)

T = 1000;
sigma = 0.1; % sigma^2 za prvu klasu
omega1 = [];

a = 5;
pocetni = 0;
krajnji = 3*pi/2;
for i=1:T   
    alfa=rand*krajnji+pocetni; % pick t in [0,3*pi/2] ili [0,5*pi/4]
    x = a*cos(alfa).^3+5;
    y = a*sin(alfa).^3;
    % Superimpose a normal distribution
    flag=0; % Jos uvek nemamo koordinate suma
    while flag==0
        u=(rand-0.5)*6*sqrt(sigma);
        v=(rand-0.5)*6*sqrt(sigma);
        w=rand;
        if w<((1/(2*pi*sigma))*exp(-(u^2+v^2)/(2*sigma)))
            flag=1;
            % u and v are sitable noise coordinates
        end % if w
    end % while
    omega1=[omega1;x+u,y+v]; % Dodavanje skupu podataka 
end % for i


    
figure
hold on
plot(omega1(:,1),omega1(:,2),'d','Color',[0 .7 0])
title('Astroida sa odbircima')


N = 1000;
M2=[7;-2];
S2=[0.9 -0.7; -0.7 0.9];
[F2,L2]=eig(S2);
T2=F2*L2^(1/2);
for i=1:N
    omega2(:,i)=T2*randn(2,1)+M2;
end;

% figure
plot(omega2(1,:),omega2(2,:),'o')
legend('Klasa \omega_1','Klasa \omega_2','Location','Best');
hold off

%% Drugi zadatak
% *Generisanje odbiraka*
N = 500;
omega1 = zeros(2,N);
omega2 = zeros(2,N);

sigma = 0.1; % sigma^2 za prvu klasu
a = 5;
pocetni_ugao = 0;
zeljeni_krajnji = 2*pi;
krajnji_ugao = zeljeni_krajnji-pocetni_ugao;

M2=[0;0];
Sigma2=[0.1 -0.09; -0.09 0.1];
[F2,L2]=eig(Sigma2);
T2=F2*L2^(1/2);

for i=1:N   
    alfa=rand*krajnji_ugao+pocetni_ugao;
%     x = a*cos(alfa).^3;
%     y = a*sin(alfa).^3;
    
    x1 = 10*(1+cos(alfa))*cos(alfa);
    y1 = 10*(1+cos(alfa))*sin(alfa);
    
    x2 = 10*cos(2*alfa);
    y2 = 10*cos(3*alfa);
    
    flag=0; 
    while flag==0
        u=(rand-0.5)*6*sqrt(sigma);
        v=(rand-0.5)*6*sqrt(sigma);
        w=rand;
        if w<((1/(2*pi*sigma))*exp(-(u^2+v^2)/(2*sigma)))
            flag=1;
            
        end
    end
    
%     omega1(:,i) = [x+u;y+v];
%     omega2(:,i) = T2*randn(2,1)+M2;
    omega3(:,i) = [x1+u;y1+v];
    omega4(:,i) = [x2+u;y2+v];
    
end
clear u v w x1 x2 alfa

figure
hold on
% plot(omega1(1,:),omega1(2,:),'d','Color',[0 .7 0])
% plot(omega2(1,:),omega2(2,:),'bo')
plot(omega3(1,:),omega3(2,:),'co')
plot(omega4(1,:),omega4(2,:),'mo')
title({'\bf \fontsize{11} {Prikaz klasa koje jesu separabilne, ali ne linearno separabilne}'})
legend('Klasa \omega_1','Klasa \omega_2','Location','SouthWest');