clc
clear
close all
% بارگذاری تصویر
%image = imread('rice.png');
image = imread('cameraman.tif');

% از استاد سوال شود
%image = double(image);
%image = im2double(image);

%step1
noise_density = 0.05; 
noisy_image = imnoise(uint8(image), 'salt & pepper', noise_density);

sigma = 2; % انحراف معیار
filter_size = 5; % اندازه کرنل
filter = fspecial('gaussian', [filter_size, filter_size], sigma);

%step2
smoothed_image = imfilter(noisy_image, filter, 'replicate');

figure;
subplot(1, 3, 1);
imshow(uint8(image), []);
title('تصویر اصلی');
axis off;

subplot(1, 3, 2);
imshow(noisy_image);
title('تصویر با نویز نمک و فلفل');
axis off;

subplot(1, 3, 3);
imshow(smoothed_image, []);
title('تصویر هموار شده');
axis off;