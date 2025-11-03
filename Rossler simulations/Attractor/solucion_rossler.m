clear all   
clc       

Za = [1, 1, 1];  % Set initial conditions 
global c;       % Declare 'c' as a global variable so it can be accessed by the 'rossler' function

for j = 1:1:100
    c = 1 + 0.05*(j-1);  % Calculate the value for parameter 'c', incrementing it in each loop
    % Define simulation time parameters and number of steps
    tini = 1;         
    tfinal = 1000;    
    M = 10000;       

    % Call the Runge-Kutta 4 solver 
    [T, Z] = rks4('rossler', tini, tfinal, Za, M);

    % Extract the time series for each state variable
    x = Z(:, 1);  
    y = Z(:, 2);  
    z = Z(:, 3); 

    % Plotting the Attractor 
    figure(1); 
    plot3(x, y, z); 
    
    % Create a dynamic title showing the current iteration 'j' and parameter 'c'
    title(['Iteration j = ', num2str(j), '; c = ', num2str(c)]);
    xlabel('X-Axis');
    ylabel('Y-Axis');
    zlabel('Z-Axis');
    grid on; 
    
    % set(gcf, 'color', 'none'); % Pone el fondo de la ventana transparente
    % set(gca, 'color', 'none'); % Pone el fondo del área de la gráfica transparente
    % saveas(gcf, 'atractor_rossler.png');
    
    pause(0.5); % Pause execution for 0.5 seconds to view the plot

    % Storing Solutions
    x_sol(:, j) = Z(:, 1);
    y_sol(:, j) = Z(:, 2);
    z_sol(:, j) = Z(:, 3);
end


% Save the time series for each state variable to disk
save xx1.dat x_sol -ascii  
%save yy1.dat y_sol -ascii  
%save zz1.dat z_sol -ascii  
save tplot.dat T -ascii     