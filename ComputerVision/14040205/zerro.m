clc;
close all;
clear;
grayImage = imread('cameraman.tif');
laplacianFilter = fspecial('laplacian', 0);
laplacianImage = imfilter(double(grayImage), laplacianFilter, 'replicate');

[rows, cols] = size(laplacianImage);
zeroCrossing = zeros(rows, cols);
for y = 2:rows-1
    for x = 2:cols-1
        % بررسی تغییر علامت در همسایگی پیکسل
        if ((laplacianImage(y, x) > 0 && laplacianImage(y, x+1) < 0) || ...
            (laplacianImage(y, x) < 0 && laplacianImage(y, x+1) > 0) || ...
            (laplacianImage(y, x) > 0 && laplacianImage(y+1, x) < 0) || ...
            (laplacianImage(y, x) < 0 && laplacianImage(y+1, x) > 0))
            zeroCrossing(y, x) = 255;
        end
    end
end


figure;
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image - Cameraman');

subplot(1, 2, 2);
imshow(zeroCrossing, []);
title('Zero Crossing Points');