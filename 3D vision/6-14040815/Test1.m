% Written By Sajad Farokhi, IAUN, Dec. 2016
% Email: sajjad_farokhi@yahoo.com

clc
clear
close all

bw1 = imread('BrokenText.tif');
se = strel('disk', 1, 4); % Cross Se



%se=[0 1 0,1 1 1,0 1 0];

bw2 = imdilate(bw1,se);

%% Show results

set(gcf,'units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1),imshow(bw1),title('Original')
subplot(1,2,2),imshow(bw2),title('Dilated')
