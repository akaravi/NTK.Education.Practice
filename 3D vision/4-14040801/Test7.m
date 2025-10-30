% Written By Sajad Farokhi, IAUN, May. 2016
% Email: sajjad_farokhi@yahoo.com

clc % Clear the command window
clear % Clear the workspace
close all % Close all Figures
addpath('Functions', 'Images')

%% Load Image
f=imread('circuit.tif');
f=im2double(f);
[m,n]=size(f);

%% FT
F=fft2(f,2*m,2*n);
[M,N]=size(F);

%% Generete Filter in Frequncy domain
D0=5;
H= lpfilter('ideal',M,N,D0);

%% Filtering

G=F.*H;

%% Change to Spatial Domain

g=ifft2(G);

%imshow(g,[])

g=g(1:m,1:n);% Remove Zeros

%% Show Results
set(gcf,'units','normalized','outerposition',[0 0 1 1])

subplot(1,2,1);imshow(f);title('Original image');
subplot(1,2,2);imshow(g);title(['Ideal lowpass filtering with \it D_0 =' num2str(D0)]);