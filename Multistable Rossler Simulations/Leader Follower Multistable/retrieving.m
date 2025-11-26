% probando que la imagen en efecto se reconstruye

A=imread("C:\Users\luismax\Pictures\estrella.jpg");
imshow(A);
dimensiones_originales = size(A); 
original_dimensions = size(A); 
R = original_dimensions(1); 
C = original_dimensions(2); 
Channels = original_dimensions(3);
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


senal_recuperada = cell2mat(packages);
A_reconstructed_double = reshape(senal_recuperada, R, C, Channels);
A_final_uint8 = uint8(A_reconstructed_double);

% 2. Visualizar la imagen recuperada
figure;
imshow(A_final_uint8);
title('Imagen Recuperada en el Receptor');