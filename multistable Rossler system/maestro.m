function dZdt = maestro(t, Z, a, b, c)  
    
    % parameters a, b, c
    a=0.2;
    b=0.2;
    c=5.7;
    
    xm1 = Z(1);
    xm2 = Z(2);
    xm3 = Z(3);
    ym1 = Z(4);
    ym2 = Z(5);
    ym3 = Z(6);
    
    % Pre-allocate the output vector
    dZdt = zeros(6,1);
    
    % Write the system equations
    
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
end