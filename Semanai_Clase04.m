close all
clear all
clc

%VIDEO:
% {
%Buscar y abrir el directorio de trabajo:
ImFolder = uigetdir;
%Crear directorio de trabajo:
pngFile = dir(strcat(ImFolder,'\*.jpg'));
%Generar arreglo con imágenes encotradas:
S = [pngFile(:).datenum];
%Ordenar los elemnentos de la matriz:
[S1,S] = sort(S);
%Guardar el arreglo en otra variable:
pngFiles = pngFile(S);
%Generar directorio del video:
VideoFile = strcat(ImFolder,'\Video');
%Escribir en la carpeta de Video:
writeObj = VideoWriter(VideoFile);
%Indicar el número de FPS:
fps = 12;
%Asignar los frames por segundo a objeto:
writeObj.FrameRate = fps;
%Abrir el archivo de video:
open(writeObj);
%Utilizar un ciclo para formar el video de imágenes:
for i=1:length(pngFiles)
    Frame = imread(strcat(ImFolder,'\',pngFiles(i).name));
    writeVideo(writeObj,im2frame(Frame));
end
%Cerrar el archivo de video:
close(writeObj);
%}