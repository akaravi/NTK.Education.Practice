clc
clear
close all
image =im2double( imread('rice.png'));
filter = [1, 0, -1; 
          1, 0, -1; 
          1, 0, -1];

[n, m] = size(image);
[k, l] = size(filter);

complexity = n * m * k * l;

tic;
full_correlation = imfilter((image), filter, 'full');
full_time = toc;


tic;
same_correlation = imfilter(image, filter, 'same');
same_time = toc;

fprintf('زمان محاسبه همبستگی full: %.6f ثانیه\n', full_time);
fprintf('زمان محاسبه همبستگیsame : %.6f ثانیه\n', same_time);
fprintf('پیجیدگی  %d \n', complexity);

figure;
subplot(1, 3, 1);
imshow(image);
title('تصویر اصلی');
axis off;

subplot(1, 3, 2);
imshow(full_correlation);
title('full',full_time);
axis off;

subplot(1, 3, 3);
imshow(same_correlation);
title('same',same_time);
axis off;