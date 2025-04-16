clc
clear
close all
% بارگذاری تصویر
%image = imread('rice.png'); % تصویر مورد نظر را بارگذاری کنید
image = imread('cameraman.tif'); % بارگذاری تصویر cameraman
image = double(image); % تبدیل به نوع عددی

% افزودن نویز نمک و فلفل
noise_density = 0.05; % چگالی نویز
noisy_image = imnoise(uint8(image), 'salt & pepper', noise_density);

% تعریف کرنل برای فیلتر Gaussian
sigma = 2; % انحراف معیار
kernel_size = 5; % اندازه کرنل
gaussian_kernel = fspecial('gaussian', [kernel_size, kernel_size], sigma);

% هموار کردن تصویر با فیلتر Gaussian
smoothed_image = imfilter(noisy_image, gaussian_kernel, 'replicate');

% نمایش تصاویر
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