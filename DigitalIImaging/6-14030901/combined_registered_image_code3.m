clc;
close all;
clear all;
% بارگذاری دو تصویر
fixed = imread('image1.jpg');
moving = imread('image2.jpg');
% تبدیل تصاویر به رنگ خاکستری (اگر رنگی باشند)
fixed_gray = rgb2gray(fixed);
moving_gray = rgb2gray(moving);
% تنظیمات بهینه‌سازی
[optimizer, metric] = imregconfig('monomodal');
% ثبت تصویر
tform = imregtform(moving_gray, fixed_gray, 'rigid', optimizer, metric);
% اعمال ترنسفورمیشن به تصویر متحرک
movingRegistered = imwarp(moving_gray, tform, 'OutputView', imref2d(size(fixed_gray)));
% نمایش تصاویر
figure;
subplot(1,3,1);
imshow(fixed_gray);
title('Fixed Image');
subplot(1,3,2);
imshow(moving_gray);
title('Moving Image');
subplot(1,3,3);
imshow(movingRegistered);
title('Registered Image');