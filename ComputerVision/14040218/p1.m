%برنامه ای بنویسید که تصویر f را بگیرد  و مراحل زیر را انجام دهد.
%1. لاپلاسین تصویر  f را  محاسبه کنید و با افزودن لاپلاسین به تصویر f   آنرا تیز کنید و حاصل را    g  بنامید 
%2. گرادیان (سوبل) تصویر  f   را محاسبه کنید و آنرا   k     بنامید.
%3. با استفاده از فیلتر میانگین گیری 5 ×5 تصویر  k   را مات کنید و آنرا   l  بنامید.
%4.        g.*l      را محاسبه کنید و حاصل را    m   بنامید .    
%5. تصویر   f     را با   m   جمع کنید و حاصل را    n  بنامید .
%6. تبدیل قانون توان را روی  n   اعمال کنید. در تبدیل قانون توان     γ=0.5     و C=1 در نظر بگیرید. 


clc;
close all;
clear;
t=0.5;
f = imread('cameraman.tif');
imgf = double(f);
%imgf= im2double(f)% بااین کلیه تصاویر سیاه می شود 
laplacian_filter = fspecial('laplacian', t);
laplacian_f = imfilter(imgf, laplacian_filter);
g = imgf + laplacian_f;

% مرحله 2: محاسبه گرادیان سوبل
sobel_filter = fspecial('sobel'); 
gradient_x = imfilter(imgf, sobel_filter);
gradient_y = imfilter(imgf, sobel_filter);
k = sqrt(gradient_x.^2 + gradient_y.^2);

% مرحله 3: مات کردن تصویر k با فیلتر میانگین 5x5
mean_filter = fspecial('average', [5 5]);
l = imfilter(k, mean_filter);

% مرحله 4: محاسبه g .* l
m = g .* l;

% مرحله 5: جمع کردن تصویر f با m
n = imgf + m;

% مرحله 6: اعمال تبدیل قانون توان روی n
C = 1;
gamma = 0.5;
n = C * (n .^ gamma);

% نمایش نتایج
figure;
subplot(2, 3, 1), imshow(f), title('Original');
subplot(2, 3, 2), imshow(uint8(g)), title('Sharpened');
subplot(2, 3, 3), imshow(uint8(k)), title('Gradient');
subplot(2, 3, 4), imshow(uint8(l)), title('Blurred');
subplot(2, 3, 5), imshow(uint8(m)), title('Multiplied');
subplot(2, 3, 6), imshow(uint8(n)), title('Final');
