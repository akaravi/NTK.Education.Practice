clc
clear
close all
img=im2double(imread('rice.png'));

% تعیین ابعاد تصویر
width = 256;  % عرض تصویر
height = 256; % ارتفاع تصویر

% ایجاد تصویر سیاه
black_image = zeros(height, width); 

% ایجاد تصویر با شدت نور 255
light_image = ones(height, width) * 255; 

gray_image =img;
%gray_image =black_image;
%gray_image =light_image;
%gray_image = rgb2gray(img);


dft = fft2(gray_image);
dft_shift = fftshift(dft); % جابجایی صفرها به وسط
magnitude_spectrum = log(abs(dft_shift) + 1); % محاسبه طیف دامنه


figure;
subplot(1, 2, 1);
imshow(gray_image, []);
title('Image');
subplot(1, 2, 2);
imshow(magnitude_spectrum, []);
title('m_s');