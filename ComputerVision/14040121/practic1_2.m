clc
clear
close all
img=im2double(imread('rice.png'));
%size 9X9
filter=[1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81;
    1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81;
    1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81;
    1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81;
    1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81;
    1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81;
    1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81;
    1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81;
    1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81,1/81];

outputimg1=imfilter(img,filter,'same','corr');
outputimg2=imfilter(img,filter,'circular','same','corr');
outputimg3=imfilter(img,filter,'replicate','same','corr');
outputimg4=imfilter(img,filter,'symmetric','same','corr');

%% Show Results
set(gcf,'units','normalized','outerposition',[0 0 1 1])
subplot(2,3,1);imshow(img);title('Original Image');
subplot(2,3,2);imshow(outputimg1);title('Zero padding');
subplot(2,3,3);imshow(outputimg2);title('circular');
subplot(2,3,4);imshow(outputimg3);title('replicate');
subplot(2,3,5);imshow(outputimg4);title('symmetric');