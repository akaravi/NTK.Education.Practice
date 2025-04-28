clc;
close all;
clear;
myImmg = imread('cameraman.tif');
laplacianFilter = fspecial('laplacian', 0);
kImgF = imfilter(im2double(myImmg), laplacianFilter, 'replicate');

[rows, cols] = size(kImgF);
zeroCrossing = zeros(rows, cols);
for y = 2:rows-1
    for x = 2:cols-1
        % بررسی تغییر علامت در همسایگی پیکسل
        if ((kImgF(y, x) > 0 && kImgF(y, x+1) < 0) || (kImgF(y, x) < 0 && kImgF(y, x+1) > 0) ||  (kImgF(y, x) > 0 && kImgF(y+1, x) < 0) || (kImgF(y, x) < 0 && kImgF(y+1, x) > 0))
            zeroCrossing(y, x) = 255;
        end
    end
end


figure;
subplot(1, 2, 1);
imshow(myImmg);
title('Original Image - Cameraman');

subplot(1, 2, 2);
imshow(zeroCrossing);
title('Zero Crossing Points');