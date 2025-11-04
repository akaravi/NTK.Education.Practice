clc 
clear
close all

img = imread('car.jpg'); 
img_gray = rgb2gray(img); 
img_double = im2double(img_gray);

F = fft2(img_double);
F_shifted = fftshift(F); % جابجایی برای مرکز کردن

[M, N] = size(F_shifted);
[U, V] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(U.^2 + V.^2); % فاصله از مرکز

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D0 = 30; % شعاع فیلتر
H = exp(-(D.^2) / (2 * D0^2)); % فیلتر گوسی
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

F_filtered = F_shifted .* H; 
F_ishifted = ifftshift(F_filtered);
img_filtered = ifft2(F_ishifted);
img_final = real(img_filtered);
img_sharpened = img_double + img_final; % ترکیب تصویر

% نمایش تصاویر و هیستوگرام‌ها
figure;

% نمایش تصاویر
subplot(3, 3, 1), imshow(img_gray), title('Original Image');
subplot(3, 3, 2), imshow(log(1 + abs(F_shifted)), []), title('Frequency Domain');
subplot(3, 3, 3), imshow(log(1 + abs(F_filtered)), []), title('Frequency by Filter Domain');
subplot(3, 3, 4), imshow(img_final, []), title('Filtered Image');
subplot(3, 3, 5), imshow(img_sharpened, []), title('Sharpened Image');

% رسم هیستوگرام‌ها
subplot(3, 3, 7); 
imhist(im2uint8( img_double), 256); % هیستوگرام تصویر خاکستری
title('Histogram Original');
legend('Original Image');
xlabel('Pixel Intensity');
ylabel('Frequency');
% رسم هیستوگرام‌ها
subplot(3, 3, 8); 
imhist(im2uint8(img_sharpened), 256); % هیستوگرام تصویر شارپ‌شده
title('Histogram Sharpened');
legend( 'Sharpened Image');
xlabel('Pixel Intensity');
ylabel('Frequency');