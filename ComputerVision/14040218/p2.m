%آستانه گذارى prewit و sobel را بدون استفاده از دستور edge انجام دهيد و خروجی را با دستور edge  مقایسه کنید
clc;
close all;
clear;

f = imread('cameraman.tif');
imgf = im2double(f);

%edge_sobel_o = edge(imgf, 'sobel');

prewitt_filter_x = [ -1 0 1; -1 0 1; -1 0 1]; 
prewitt_filter_y = [ -1 -1 -1; 0 0 0; 1 1 1]; 

sobel_filter_x = [ -1 0 1; -2 0 2; -1 0 1];
sobel_filter_y = [ -1 -2 -1; 0 0 0; 1 2 1];

% Prewitt
gradient_x_prewitt = imfilter(imgf, prewitt_filter_x);
gradient_y_prewitt = imfilter(imgf, prewitt_filter_y);
gradient_magnitude_prewitt = sqrt(gradient_x_prewitt.^2 + gradient_y_prewitt.^2);

%Sobel
gradient_x_sobel = imfilter(imgf, sobel_filter_x);
gradient_y_sobel = imfilter(imgf, sobel_filter_y);
gradient_magnitude_sobel = sqrt(gradient_x_sobel.^2 + gradient_y_sobel.^2);


threshold=.2;
% مرحله 3: آستانه‌گذاری
edges_prewitt = gradient_magnitude_prewitt > threshold; 
edges_sobel = gradient_magnitude_sobel > threshold;


edge_prewitt_o = edge(imgf, 'prewitt',threshold); 
edge_sobel_o = edge(imgf, 'sobel',threshold);


figure;
subplot(2, 3, 1), imshow(f), title('Original');
subplot(2, 3, 2), imshow(edges_prewitt), title('(Prewitt - my code)');
subplot(2, 3, 3), imshow(edge_prewitt_o), title('(Prewitt - Edge func)');
subplot(2, 3, 4), imshow(edges_sobel), title('(Sobel - my code)');
subplot(2, 3, 5), imshow(edge_sobel_o), title('(Sobel - func)');
