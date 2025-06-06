clc;
close all;
clear;

karaviImg = imread('cameraman.tif');

% اعمال فیلترهای Sobel برای محاسبه گرادیان در جهت x و y
Gx = fspecial('sobel');
Gy = Gx';

gradientX = imfilter(im2double(karaviImg), Gx, 'replicate');
gradientY = imfilter(im2double(karaviImg), Gy, 'replicate');

% محاسبه اندازه و جهت بردار گرادیان
magnitude = sqrt(gradientX.^2 + gradientY.^2);
direction = atan2(gradientY, gradientX);

% تبدیل جهت از رادیان به درجه
directionDegrees = rad2deg(direction);


figure;
subplot(1, 2, 1);
imshow(karaviImg);
title('Original Image - Cameraman');

subplot(1, 2, 2);
imshow(directionDegrees, []);
title('Gradient Direction in Degrees');
colormap jet;
colorbar;