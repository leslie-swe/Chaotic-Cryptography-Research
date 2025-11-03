function dZdt = rossler(t, Z)
% El vector de entrada se llama Z, no X.

% Parámetros fijos del sistema
a = 0.2;
b = 0.2;
%c = 5.7;
global c;
% Declara la variable C como global para que tome el valor 
% que le das en tu script principal.
%global C 

% 1. Extraemos los valores del vector de entrada Z
x = Z(1);
y = Z(2);
z = Z(3);

% Pre-alocamos el vector de salida para mayor eficiencia
dZdt = zeros(3,1);

% 2. Escribimos las ecuaciones con la sintaxis correcta
dZdt(1) = -y - z;
dZdt(2) = x + a*y;
dZdt(3) = b + z*(x - c); % Usamos la C global y paréntesis para claridad