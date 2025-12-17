% Written By Sajad Farokhi, IAUN, Dec. 2016
% Email: sajjad_farokhi@yahoo.com

clc
clear
close all
addpath('Images', 'Functions');
img=imread('Nletter.bmp');
sq=ones(3,3);
nf=regfill(img,[27,8],sq);%starting at  point  with  coordinates [27,8]
set(gcf,'units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1),imshow(img);title('Original Image')
subplot(1,2,2),imshow(nf);title('Filled Image')
