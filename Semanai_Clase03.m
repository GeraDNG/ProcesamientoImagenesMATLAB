clear all
close all
clc

%Graficar la funci�n: z=x^2*y-2x
%{
%Vectores tipo fila:
x=-5:0.03:5;
y=-5:0.03:5;
%Convierte vectores a matrices:
[X, Y] = meshgrid(x,y);
%Obtener la matriz Z:
Z = X.^2.*Y-2.*X;
%Hacer gr�fico tipo superficie:
mesh(X,Y,Z);
title('Funci�n Z:');
%}

%Graficar la funci�n: z=sqr(x^2+y^2)
%{
%Vectores tipo fila:
x=-3:0.03:3;
y=-3:0.03:3;
%Convierte vectores a matrices:
[X, Y] = meshgrid(x,y);
%Obtener la matriz Z:
Z = sqrt(X.^2+Y.^2);
%Hacer gr�fico tipo superficie:
mesh(X,Y,Z);
title('Funci�n Z:');
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');
%}

%Detecci�n de bordes en imagen:
%{
%Leer im�genes:
I1 = imread('E:\celulas.jpg');
I2 = imread('E:\edificio.jpg');
%Convertir im�genes a escala de grises:
G1 = rgb2gray(I1); 
G2 = rgb2gray(I2);
%Detectar bordes:
B1 = edge(G1,'canny'); %C�rculos, elipses, etc
B2 = edge(G2,'sobel'); %Bordes horizontales o verticales (l�neas)
%Mostrar im�genes:
figure();
subplot(2,2,1);
imshow(I1);
title('Imagen a color RGB:');
subplot(2,2,2);
imshow(B1);
title('Detecci�n de bordes:');
subplot(2,2,3);
imshow(I2);
title('Imagen a color RGB:');
subplot(2,2,4);
imshow(B2);
title('Detecci�n de bordes:');
%}

%Filtro:
%{
A = imread('tigre.jpg');
B = imfilter(A,2,'circular');
figure();
subplot(1,2,1);
imshow(A);
title('Imagen a color RGB:');
subplot(1,2,2);
imshow(B);
title('Filtro:');
%}

%Ruido y filtros Gaussian y Average:
% {
%Leer imagen:
I = imread('edificio.jpg');
%Aplicar ruido:
R = imnoise(I);
%Formar las m�scaras:
w1 = fspecial('gaussian');
w2 = fspecial('average');
%Filtrar imagen:
F1 = imfilter(R,w1);
F2 = imfilter(R,w2);
%Mostrar:
figure();
subplot(2,2,1);
imshow(I);
title('Imagen Original:');
subplot(2,2,2);
imshow(R);
title('Imagen con Ruido:');
subplot(2,2,3);
imshow(F1);
title('Imagen con filtro Gaussiano:');
subplot(2,2,4);
imshow(F2);
title('Imagen con filtro Promedio:');
%}

%Filtro motion, disk, unsharp:
% {
%Leer imagen:
I = imread('cameraman.tif');
%Formar las m�scaras:
M = fspecial('motion',20,45);
D = fspecial('disk',10);
U = fspecial('unsharp');
%Aplicar filtro con m�scaras:
F1 = imfilter(I,M, 'replicate');
F2 = imfilter(I,D, 'replicate');
F3 = imfilter(I,U, 'replicate');
%Mostrar:
figure();
subplot(2,2,1);
imshow(I);
title('Imagen Original:');
subplot(2,2,2);
imshow(F1);
title('Imagen con m�scara Movido:');
subplot(2,2,3);
imshow(F2);
title('Imagen con filtro Efecto Borroso:');
subplot(2,2,4);
imshow(F3);
title('Imagen con filtro Mejor Contraste:');
%}