clc
clear
close all

%image = imread('rice.png');
image = imread(( 'cameraman.tif'));

%تارشدگی جرکتی
filter1 = fspecial('motion', 20, 45); % طول 20 و زاویه 45 درجه
img1 = imfilter(image, filter1, 'symmetric');

% مشکل فوکوس
Filter2 = fspecial('gaussian', [5 5], 2);
img2 = imfilter(image, Filter2, 'symmetric');

%تارشدگی جوی
filter3 = fspecial('average', [5 5]); 
img3 = imfilter(image, filter3, 'symmetric');

figure;
subplot(2, 2, 1);
imshow(image);
title('تصویر اصلی');
axis off;

subplot(2, 2, 2);
imshow(img1);
title('تارشدگی حرکتی');
axis off;

subplot(2, 2, 3);
imshow(img2);
title('تارشدگی فوکوس اشتباه');
axis off;

subplot(2, 2, 4);
imshow(img3);
title('تارشدگی شرایط جوی');
axis off;