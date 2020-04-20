close all
clear all
%Buscar y abrir el directorio trabajo
ImFolder = uigetdir;
%crear directorio de trabajo
pngFile = dir(strcat(ImFolder, '\*.jpg'));
%Formar arreglo con imagenes
S = [pngFile(:).datenum];
%ordenar los elementos de la matriz
[S,S] = sort(S);
%Guardar  arreglo en otra variable
pngFiles = pngFile(S);
%Generar directorio del video
VideoFile = strcat(ImFolder,'\Video');
%Escribir en la carpeta de Video
writeObj = VideoWriter(VideoFile);
%Cuadros por segundos
fps = 60;
%Asignar los frames por segundo a objeto
writeObj.FrameRate  = fps;
%Abrir el archivo de video
open(writeObj);
%utilizar im cocñp ára formar el video de imagenes
for t=1:length(pngFiles)
   Frame = imread(strcat(ImFolder,'\',pngFiles(t).name));
   writeVideo(writeObj,im2frame(Frame));
end
%Cerrar el archivo
close(writeObj);
