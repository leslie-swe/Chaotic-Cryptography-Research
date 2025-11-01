clear all
clc
load xx2.dat
load tplot.dat
 
 for j=1:1:500
  c=-8+0.0320*(j-1)
  j;    
  c_2(j)=c;
  
vx=xx2(:,j);%vx toma los valores de las soluciones en el eje x

 %Local maxima for vx
 % subplot(3,1,1)

	%vx = vx(1:max(size(vx)));
    vx = vx(1:end);
	lmx = locmax(vx);%Evaluate vx and return the indices of the local maxima.
	vx = vx(lmx);%vx contains only the maximum values
    t_lmx=tplot(lmx);%That value in 'y' is assigned to the time.

    %Plot bifurcation diagram v vs. t
    figure(1)
    subplot(2,1,1)
 	plot(vx,'.')
 	title(num2str(j));
 	xlabel('n');ylabel('vx');
 	pause(0.1)
 	hold off  
    subplot(2,1,2)
 	plot(tplot',xx2(:,j),'b-')
    hold on;
    plot(t_lmx,vx,'r*')
 	title(num2str(j));
 	xlabel('n');ylabel('vx');
 	pause(0.1)
 	hold off    
   for jv = 0:1:31%Iterate over the last 31 maxima.
 	bifx(j,jv+1) = vx(max(size(vx))-jv);
   end

end   

   save bifx.dat bifx -ascii;
  
    
figure(2)
 
plot(c_2, bifx, 'k.', 'MarkerSize', 2)
xlabel('c control parameter')
ylabel('local maximumX')
title('Biburcation diagram')
grid
 

