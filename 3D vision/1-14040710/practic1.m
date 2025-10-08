clc
clear
close all
img=im2double(imread('rice.png'));
gray_image =img;
%gray_image = rgb2gray(img);


dft = fft2(double(gray_image));
dft_shift = fftshift(dft); % جابجایی صفرها به وسط
magnitude_spectrum = log(abs(dft_shift) + 1); % محاسبه طیف دامنه

% نمایش نتایج
figure;
subplot(1, 2, 1);
imshow(gray_image, []);
title('Input Image');
subplot(1, 2, 2);
imshow(magnitude_spectrum, []);
title('Magnitude Spectrum');