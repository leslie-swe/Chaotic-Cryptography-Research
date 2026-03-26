function dZdt = masterslave(t, Z, a, b, c)
   
    global k;
    
    % Assing value to parameters a, b, c
    a=0.2;
    b=0.2;
    c=5.7;
    
    % Master variables
    xm1 = Z(1); xm2 = Z(2); xm3 = Z(3); ym1 = Z(4); ym2 = Z(5); ym3 = Z(6);
    
    % Slave variables
    xs1 = Z(7); xs2 = Z(8); xs3 = Z(9); ys1 = Z(10); ys2 = Z(11); ys3 = Z(12);
    
    % Pre-allocate the output vector
    dZdt = zeros(12,1);
    
    % Write the system equations
    
    % Master Equations 
    
    % Equation 1
    dZdt(1) = -xm2 - xm3;
    
    % Equation 2 
    dZdt(2) = xm1 + a*ym2; 
    
    % Equation 3
    dZdt(3) = b - c*xm3 + ym1*ym3;
    
    % Equation 4
    dZdt(4) = xm1 - ym1 - xm2 - xm3;
    
    % Equation 5
    dZdt(5) = ym1 + a*ym2;
    
    % Equation 6
    dZdt(6) = b + ym3*(ym1 - c);
    
    % Slave Equations 
    
    % Equation 1 with coupling k*(xm1-xs1)
    dZdt(7) = -xs2 - xs3 + k*(xm1-xs1);
    
    % Equation 2
    dZdt(8) = xs1 + a*ys2; 
    
    % Equation 3
    dZdt(9) = b - c*xs3 + ys1*ys3;
    
    % Equation 4
    dZdt(10) = xs1 - ys1 - xs2 - xs3;
    
    % Equation 5
    dZdt(11) = ys1 + a*ys2;
    
    % Equation 6
    dZdt(12) = b + ys3*(ys1 - c);
end