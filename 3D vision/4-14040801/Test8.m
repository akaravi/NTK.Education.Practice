% Written By Sajad Farokhi, IAUN, May. 2016
% Email: sajjad_farokhi@yahoo.com

clc % Clear the command window
clear % Clear the workspace
close all % Close all Figures

addpath('Functions', 'Images')

%% Load Image
f=imread('cameraman.tif');
f=im2double(f);
[m,n]=size(f);

%% FFT
F=fft2(f,2*m,2*n);
[M,N]=size(F);

%% Generete Filter in Frequncy domain
D0=50;
H= lpfilter('ideal',M,N,D0);

% Filtering
g = dftfilt2(F,H,m,n);

%% Show Results
set(gcf,'units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1);imshow(f);title('Original image');
subplot(1,2,2);imshow(g);title(['Ideal lowpass filtering with \it D_0 =' num2str(D0)]);