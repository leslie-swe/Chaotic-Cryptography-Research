clear all 
clc
r = 4;           % parámetro de control
x0 = 0.7;        % condición inicial (entre 0 y 1)
N = 300;         % número de iteraciones
%for i=1:1:5
%    x0= 0.1+0.17*i;

% Inicialización del vector
y01 = zeros(N, 1);
y01(1) = x0;

% Iteración del mapa logístico
for n = 1:N-1
    y01(n+1) = r * y01(n) * (1 - y01(n));
end

for j=1:1:100
    
    % y01=-8+0.16*(j-1);
    Za=[-0.1,0.01,0.3,y01(j),0.2,0.2];% Iterate the initial condition to analyze how the master is affected
   
tini=1;tfinal=1000;M=10000;
[T, Z] =rks4('maestro',tini,tfinal,Za,M);%  This function solves the system.
% The solution of each state variable is saved in matrix Z.

x=Z(:,1); 
y=Z(:,2);
z=Z(:,3);
x2=Z(:,4);
y2=Z(:,5);
z2=Z(:,6);

figure(1); % Create a new figure
plot3(x, y, z);% Plot the attractor for each value of the initial condition Y01.
title([ ',j = ',num2str(j),';y01=',num2str(y01(j))])

xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');
grid;

figure(2);% Plot the second attractor of the system as we can't plot the 6 state variables in the same figure
plot3(x2, y2, z2);
title([ ',j = ',num2str(j),';y01=',num2str(y01(j))])

xlabel('X Axis');
ylabel('Y Axis');
zlabel('Z Axis');
grid;

pause(0.5);

x2_sol(:,j)=Z(:,4);

end

% Saving the time series of the state variable to plot the bifurcation diagram later
 % save xx2.dat x2_sol -ascii
 % save tplot.dat T   -ascii
  
