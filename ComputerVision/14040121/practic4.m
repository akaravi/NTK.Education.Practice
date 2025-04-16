clc
clear
close all
% بارگذاری تصویر
%image = imread('rice.png'); % تصویر مورد نظر را بارگذاری کنید
image = imread('cameraman.tif'); % بارگذاری تصویر cameraman

% تعریف کرنل برای تارشدگی حرکتی
motion_kernel = fspecial('motion', 20, 45); % طول 20 و زاویه 45 درجه
motion_blurred_image = imfilter(image, motion_kernel, 'symmetric');

% تعریف کرنل برای تارشدگی از طریق فوکوس اشتباه
focus_kernel = fspecial('gaussian', [5 5], 2); % کرنل Gaussian
focus_blurred_image = imfilter(image, focus_kernel, 'symmetric');

% تعریف کرنل برای تارشدگی در اثر شرایط جوی
weather_kernel = fspecial('average', [5 5]); % کرنل میانگین
weather_blurred_image = imfilter(image, weather_kernel, 'symmetric');

% نمایش تصاویر
figure;

subplot(2, 2, 1);
imshow(image);
title('تصویر اصلی');
axis off;

subplot(2, 2, 2);
imshow(motion_blurred_image);
title('تارشدگی حرکتی');
axis off;

subplot(2, 2, 3);
imshow(focus_blurred_image);
title('تارشدگی فوکوس اشتباه');
axis off;

subplot(2, 2, 4);
imshow(weather_blurred_image);
title('تارشدگی شرایط جوی');
axis off;