%Verify synchronization.
tini=1;tfinal=2000;M=100000;%Iteration steps
global k;
for j=1:1:100
    
    % Define initial conditions
    Za=[-0.1,0.01,0.3,1,0.2,0.2,0.1,-0.01,2,2,3,1];
    k=1.4+j*0.0140;
    [T,Z]=rks4('masterslave',tini,tfinal,Za,M);

% Asiggn one coloumb for each Z solution
x=Z(:,1);
y=Z(:,2);
z=Z(:,3);
x2=Z(:,4);
y2=Z(:,5);
z2=Z(:,6);
xs=Z(:,7);
ys=Z(:,8);
zs=Z(:,9);
x2s=Z(:,10);
y2s=Z(:,11);
z2s=Z(:,12);

figure(1); 
plot(x(3000:end, 1),xs(3000:end,1));%Removing the transient period
title([ ',j = ',num2str(j),';k=',num2str(k)])

xlabel('Eje X');
ylabel('Eje XS');
grid;


pause(0.5);

end