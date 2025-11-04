clc 
clear
close all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D0_array = [10, 20, 30, 40, 50]; % مقادیر مختلف D0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

img = imread('car.jpg'); 
img_gray = rgb2gray(img); 
img_double = im2double(img_gray);


F = fft2(img_double);
F_shifted = fftshift(F);

figure;
subplot(length(D0_array)+2, 3, 1), imshow(img_gray), title('Original Image');
% رسم هیستوگرام‌ها
subplot(length(D0_array)+2, 3, 2); 
imhist(im2uint8( img_double), 256);
title('Histogram Original');
legend('Original Image');
xlabel('Pixel Intensity');
ylabel('Frequency');
subplot(length(D0_array)+2, 3, 3), imshow(log(1 + abs(F_shifted)), []), title('Frequency Domain');

[M, N] = size(F_shifted);
[U, V] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);
D = sqrt(U.^2 + V.^2); % فاصله از مرکز


for i = 1:length(D0_array)
    D0 = D0_array(i); % مقدار D0 فعلی
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    H = 1 - exp(-(D.^2) / (2 * D0^2)); % فیلتر بالاگذر گوسی
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % اعمال فیلتر
    F_filtered = F_shifted .* H; 
    F_ishifted = ifftshift(F_filtered);
    img_filtered = ifft2(F_ishifted);
    img_final = real(img_filtered);

    % رسم نتایج
    subplot(length(D0_array)+2, 3, i*3 + 1), imshow(log(1 + abs(F_filtered)), []), title(['Frequency by Filter Domain (D0 = ', num2str(D0), ')']);
    
    % رسم هیستوگرام تصویر فیلتر شده
    subplot(length(D0_array)+2, 3, i*3 + 2); 
    imhist(im2uint8(img_final), 256);
    title(['Histogram Sharpened (D0 = ', num2str(D0), ')']);
    xlabel('Pixel Intensity');
    ylabel('Frequency');
    
    subplot(length(D0_array)+2, 3, i*3 + 3), imshow(img_final, []), title(['Filtered Image (D0 = ', num2str(D0), ')']);
end