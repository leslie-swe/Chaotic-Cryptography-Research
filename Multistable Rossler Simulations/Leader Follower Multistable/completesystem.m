A=imread("C:\Users\luismax\Pictures\estrella.jpg");
dimensiones_originales = size(A); 
R = dimensiones_originales(1); 
C = dimensiones_originales(2); 
Channels = dimensiones_originales(3);
A=double(A);
senal_informacion = A(:); 
package_size = 900; 
total_elements = length(senal_informacion);
num_full_packages = floor(total_elements / package_size);
last_package_size = mod(total_elements, package_size);
row_divisions = repmat(package_size, 1, num_full_packages);
if last_package_size > 0
    row_divisions = [row_divisions, last_package_size];
end
packages = mat2cell(senal_informacion, row_divisions, 1);

num_paquetes = length(row_divisions);
decrypted_j = cell(num_paquetes, 1);

tini=1;tfinal=2000;M=100000;
r = 4;           
x0 = 0.7;        
N = 300;         
y01 = zeros(N, 1);
y01(1) = x0;

for n = 1:N-1
    y01(n+1) = r * y01(n) * (1 - y01(n));
end

global k;

% Longitud de la máscara con padding: 2600 (padding) + 900 (paquete) = 3500
TARGET_LENGTH = 3500; 
INITIAL_PADDING = 2600;

for j=1:num_paquetes
    y_0=-8+y01(j)*16;
    current_package = packages{j};
    current_packagem = current_package*0.001;
    
    Za=[-0.1,0.01,0.3,y_0,0.2,0.2,0.1,-0.01,2,2,3,1];
    k=1;
    [T,Z]=rks4('masterslave',tini,tfinal,Za,M);

    x2=Z(:,4);x2s=Z(:,10);
    
    % 1. CRÍTICO: FORZAR a que la máscara caótica tenga EXACTAMENTE 3500 elementos
    xm = x2(end - TARGET_LENGTH + 1 : end, 1);
    xss = x2s(end - TARGET_LENGTH + 1 : end, 1);
    
    timev = T(end - TARGET_LENGTH + 1 : end, 1);
    
    % 2. Construir la señal de información parcial (padding + paquete actual)
    infsignal_partial = [zeros(INITIAL_PADDING, 1); current_packagem];
    
    % 3. Rellenar con ceros hasta igualar la longitud objetivo (TARGET_LENGTH)
    needed_padding = TARGET_LENGTH - length(infsignal_partial);
    
    if needed_padding > 0
        infsignal = [infsignal_partial; zeros(needed_padding, 1)];
    else
        infsignal = infsignal_partial;
    end
    
    % 4. SUMA (Compatible ahora porque ambos vectores son de longitud 3500)
    st = xm + infsignal; 

    % --- DESCIFRADO ---
    decrypted_packages= st - xss;
    decrypted_packagesm=decrypted_packages*1000;

    % 5. ELIMINAR PADDING y seleccionar solo el paquete original
    recovered_package_unpadded = decrypted_packagesm(INITIAL_PADDING + 1 : INITIAL_PADDING + length(current_package)); 
    decrypted_j{j} = recovered_package_unpadded; 

    
    % El código de ploteo ha sido omitido para brevedad.
    % Se recomienda realizar una revisión de las longitudes en el código de ploteo también.
    
    % --- DIAGNÓSTICO DE SINCRONIZACIÓN ---
    sync_error = xm - xss;
    figure(5); 
    plot(timev, sync_error);
    title(['Error de Sincronización (xm - xss) en Paquete ', num2str(j)]);
    ylabel('Error Numérico');
    xlabel('Tiempo');
    
    pause(0.5);
end

senal_recuperada = cell2mat(decrypted_j);
A_reconstructed_double = reshape(senal_recuperada, R, C, Channels);
A_final_uint8 = uint8(A_reconstructed_double);

figure;
imshow(A_final_uint8);
title('Imagen Recuperada en el Receptor');