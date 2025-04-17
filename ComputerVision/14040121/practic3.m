clc
clear
close all
image =im2double( imread('rice.png'));
sizes = [3, 5, 7, 9,15]; 

figure;
subplot(2, 3, 1);
imshow(image);
title('تصویر اصلی');
axis off;
for i = 1:length(sizes)
    filterSize = sizes(i);
    filter = ones(filterSize) / (filterSize^2);
    f_image = imfilter(image, filter, 'replicate');

    subplot(2, 3, i+1);
    imshow(f_image);
    title(['filtter (Size = ', num2str(filterSize), ')']);
    axis off;
end
