%پياده سازى رويكرد maar -hildreth بدون استفاده از دستور edge و خروجی را با دستور edge  مقایسه کنید
clc;
close all;
clear;
f = imread('cameraman.tif');
%imgf = im2double(f);
imgf = double(f);


sigma = 1.0; 
size = 5;
[x, y] = meshgrid(-floor(size/2):floor(size/2), -floor(size/2):floor(size/2));
gaussian_filter = exp(-(x.^2 + y.^2) / (2 * sigma^2));
gaussian_filter = gaussian_filter / sum(gaussian_filter(:));


smoothed_image = imfilter(imgf, gaussian_filter, 'replicate');


laplacian_filter = [0 1 0; 1 -4 1; 0 1 0]; 
laplacian_image = imfilter(smoothed_image, laplacian_filter, 'replicate');


threshold = 0.1 * max(laplacian_image(:));
edges_marr_hildreth = abs(laplacian_image) > threshold; 


edge_Main = edge(imgf, 'log');


figure;
subplot(2, 3, 1), imshow(uint8(imgf)), title('Original Image');
subplot(2, 3, 2), imshow(edges_marr_hildreth), title('Edges (Marr-Hildreth - Manual)');
subplot(2, 3, 3), imshow(edge_Main), title('Edges (Marr-Hildreth - Edge)');
