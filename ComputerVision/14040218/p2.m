%آستانه گذارى prewit و sobel را بدون استفاده از دستور edge انجام دهيد و خروجی را با دستور edge  مقایسه کنید
clc;
close all;
clear;

f = imread('cameraman.tif');
imgf = im2double(f);


prewitt_filter_x = [ -1 0 1; -1 0 1; -1 0 1]; 
prewitt_filter_y = [ -1 -1 -1; 0 0 0; 1 1 1]; 

sobel_filter_x = [ -1 0 1; -2 0 2; -1 0 1];
sobel_filter_y = [ -1 -2 -1; 0 0 0; 1 2 1];

% محاسبه گرادیان با استفاده از فیلتر Prewitt
gradient_x_prewitt = imfilter(imgf, prewitt_filter_x);
gradient_y_prewitt = imfilter(imgf, prewitt_filter_y);
gradient_magnitude_prewitt = sqrt(gradient_x_prewitt.^2 + gradient_y_prewitt.^2);

% محاسبه گرادیان با استفاده از فیلتر Sobel
gradient_x_sobel = imfilter(imgf, sobel_filter_x);
gradient_y_sobel = imfilter(imgf, sobel_filter_y);
gradient_magnitude_sobel = sqrt(gradient_x_sobel.^2 + gradient_y_sobel.^2);

% مرحله 3: آستانه‌گذاری
threshold_prewitt = 0.2 * max(gradient_magnitude_prewitt(:)); % تعیین آستانه Prewitt
edges_prewitt = gradient_magnitude_prewitt > threshold_prewitt; 

threshold_sobel = 0.2 * max(gradient_magnitude_sobel(:)); % تعیین آستانه Sobel
edges_sobel = gradient_magnitude_sobel > threshold_sobel;


edges_edge_prewitt = edge(uint8(imgf), 'prewitt'); 
edges_edge_sobel = edge(uint8(imgf), 'sobel');


figure;
subplot(2, 3, 1), imshow(uint8(f)), title('Original');
subplot(2, 3, 2), imshow(edges_prewitt), title('(Prewitt - my code)');
subplot(2, 3, 3), imshow(edges_edge_prewitt), title('(Prewitt - Edge func)');
subplot(2, 3, 4), imshow(edges_sobel), title('(Sobel - my code)');
subplot(2, 3, 5), imshow(edges_edge_sobel), title('(Sobel - func)');
