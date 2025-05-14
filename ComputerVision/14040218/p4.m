%پياده سازى رويكرد canny بدون استفاده از دستور edge و خروجی را با دستور edge  مقایسه کنید
clc;
close all;
clear;
f = imread('cameraman.tif');
imgf = im2double(f);
%imgf = double(f);


sigma = 1.0;
mySize = 5;
gaussian_filter = fspecial('gaussian', [mySize mySize], sigma); 


smoothed_image = imfilter(imgf, gaussian_filter, 'replicate');


sobel_filter_x = [-1 0 1; -2 0 2; -1 0 1]; 
sobel_filter_y = [-1 -2 -1; 0 0 0; 1 2 1]; 


gradient_x = imfilter(smoothed_image, sobel_filter_x, 'replicate');
gradient_y = imfilter(smoothed_image, sobel_filter_y, 'replicate');
gradient_magnitude = sqrt(gradient_x.^2 + gradient_y.^2);
gradient_direction = atan2(gradient_y, gradient_x);


high_threshold = 0.3 * max(gradient_magnitude(:));
low_threshold = 0.1 * high_threshold;


strong_edges = gradient_magnitude >= high_threshold;
weak_edges = (gradient_magnitude >= low_threshold) & (gradient_magnitude < high_threshold);


edges_canny = zeros(size(imgf)); 
edges_canny(strong_edges) = 1; 


for i = 2:size(imgf, 1)-1
    for j = 2:size(imgf, 2)-1
        if weak_edges(i, j) && ...
           (strong_edges(i-1, j-1) || strong_edges(i-1, j) || strong_edges(i-1, j+1) || ...
            strong_edges(i, j-1) || strong_edges(i, j+1) || ...
            strong_edges(i+1, j-1) || strong_edges(i+1, j) || strong_edges(i+1, j+1))
            edges_canny(i, j) = 1;
        end
    end
end

edges_edge = edge(uint8(imgf), 'Canny'); 

figure;
subplot(2, 3, 1), imshow(f), title('Original ');
subplot(2, 3, 2), imshow(edges_canny), title('Edges (Canny - my code)');
subplot(2, 3, 3), imshow(edges_edge), title('Edges (Canny - func)');
