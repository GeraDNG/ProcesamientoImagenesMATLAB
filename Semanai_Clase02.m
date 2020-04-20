clear all
close all
clc

%Crear una matriz:
%{
A = [0 0 0; 0 0 0; 0 0 0]
A = zeros(512,512);
B = ones(128,128);
%Imprimir:
imshow(A);
%}

%Crear matriz binaria B&N:
%{
B = ones(256,256);
BIN =  B;
BIN(1:128,1:128) = zeros(128,128);
BIN(129:256,129:256) = zeros(128,128);
imshow(BIN);
%}

%Leer imagen como matriz a escala de grises:
%{
I = imread('cameraman.tif');
imshow(I);
%}

%Leer imagen a color:
%{
I = imread('peppers.png');
imshow(I);  
%}

%Pasar imagen RGB a escala de grises:
%{
I = imread('peppers.png');
G = rgb2gray(I);
imshow(G); 
 %}

%Pasar imagen de color a gris y de gris a B&N:
%{
I = imread('peppers.png');
G = rgb2gray(I);
X = im2bw(G);
imshow(X);
%}

%Mostrar por capas RGB:
%{
I = imread('peppers.png');
R = I(:,:,1);
imshow(R);
B = I(:,:,3);
imshow(B);
%}

%Matriz transpuesta:
%{
A = [1 2 3; -1 2 7; 0 5 -3]
B = A'
%}

%Rotar una imagen con matriz transpuesta:
%{
I = imread('peppers.png');
G = rgb2gray(I);
X = G';
imshow(X);  
%}

%Matriz aleatoria:
%{
A = rand(1024,1024);
imshow(A);
%}

%Matriz mágica:
%{
A = magic(5)
surf(A)
%}

%SUBPLOT:
%{
I = imread('peppers.png');
R = I(:,:,1);
G = I(:,:,2);
B = I(:,:,3);
figure();
%subplot(filas,columnas,posición);
subplot(2,2,1);
imshow(I);
title('Imagen a color RGB');
subplot(2,2,2);
imshow(R);
title('Capa roja');
subplot(2,2,3);
imshow(G);
title('Capa verde');
subplot(2,2,4);
imshow(B);
title('Capa azul');
%}

%Ejercicio 1:
%{
I = imread('C:\Users\gerar\OneDrive\Escritorio\tigre.jpg');
G = rgb2gray(I);
BN = im2bw(I);
figure();
%subplot(filas,columnas,posición);
subplot(1,3,1);
imshow(I);
title('Imagen a color RGB:');
subplot(1,3,2);
imshow(G);
title('Escala de grises:');
subplot(1,3,3);
imshow(BN);
title('Imagen binaria:');
%}

%redimensionar imagen:
%{
I = imread('C:\Users\gerar\OneDrive\Escritorio\tigre.jpg');
size(I)
G = I(:,:,2);
X = imresize(G,[369*2 642*2]);
imshow(X);
title('Redimencionada:');
%}

%Rotar una imagen:
%{
I = imread('C:\Users\gerar\OneDrive\Escritorio\binaria.png');
r = imrotate(I,45);
imshow(r);
%}

%Dilatación y Erosión:
% {
I = imread('C:\Users\gerar\OneDrive\Escritorio\tigre.jpg');
G = rgb2gray(I);
BIN = im2bw(I);
SE = strel('line',11,90);
D = imdilate(BIN,SE);
w = eye(3);
E = imerode(BIN,w);
figure();
subplot(1,3,1);
imshow(I);
title('Imagen a color RGB:');
subplot(1,3,2);
imshow(D);
title('Imagen Dilatada:');
subplot(1,3,3);
imshow(E);
title('Imagen Erosionada:');
%}

%Guardar imagen:
%{
imwrite(E,'C:\Users\gerar\OneDrive\Escritorio\tigreErosionada.png')
%}

%Ejercicio 3:
% {
%Original 1 & dilatación:
I = imread('cameraman.tif');
BIN = im2bw(I);
SE = strel('line',11,90);
D = imdilate(BIN,SE);
%Original 2 & erode:
O = imread('circbw.tif');
w = eye(3);
E = imerode(O,w);
%Graficar:
figure();
subplot(2,2,1);
imshow(I);
title('Imagen Original 1:');
subplot(2,2,3);
imshow(O);
title('Imagen Original 2:');
subplot(2,2,2);
imshow(D);
title('Imagen Dilatada 1:');
subplot(2,2,4);
imshow(E);
title('Imagen Erosión 2:');
%}