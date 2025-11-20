clc 
clear
close all
bw = imread('45.bmp');

se1 = strel('square', 5); %Square SE%
se2 = strel('square', 9); %Square SE%
se3 = strel('square', 17); %Square SE%

%se1=ones(3,3);

bw2 = imerode(bw,se1);
bw3 = imerode(bw,se2);
bw4 = imerode(bw,se3);

%% Show results

set(gcf,'units','normalized','outerposition',[0 0 1 1])
subplot(1,4,1),imshow(bw),title('Original' )
subplot(1,4,2),imshow(bw2),title(['Erosion' ' square 5'])
subplot(1,4,3),imshow(bw3),title(['Erosion' ' square 9'])
subplot(1,4,4),imshow(bw4),title(['Erosion' ' square 17'])