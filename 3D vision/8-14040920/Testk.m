% Written By Sajad Farokhi, IAUN, Dec. 2016
% Email: sajjad_farokhi@yahoo.com

clc
clear
close all
%addpath('Images', 'Functions');


img=imread('k.png');
bw1=im2bw(img,graythresh(img));

se1 = strel('disk',5, 4); 

bw2=imclose(bw1,se1);

%% Show results

set(gcf,'units','normalized','outerposition',[0 0 1 1])
subplot(1,3,1),imshow(img), title('Original')
subplot(1,3,2), imshow(bw1), title(' Thresholded Image')
subplot(1,3,3), imshow(bw2), title('Closing')