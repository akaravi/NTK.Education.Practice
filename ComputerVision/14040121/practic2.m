clc
clear
close all
% بارگذاری تصویر
image =im2double( imread('rice.png'));

% تعریف کرنل (فیلتر)
kernel = [1, 0, -1; 
          1, 0, -1; 
          1, 0, -1];


% ابعاد تصویر و کرنل
[n, m] = size(image);
[k, l] = size(kernel);

% محاسبه پیچیدگی
complexity = n * m * k * l;


% محاسبه زمان برای همبستگی کامل
tic; % شروع زمان‌سنجی
full_correlation = imfilter((image), kernel, 'full');
full_time = toc; % پایان زمان‌سنجی

% محاسبه زمان برای همبستگی با padding مشابه
tic; % شروع زمان‌سنجی
same_correlation = imfilter(double(image), kernel, 'same');
same_time = toc; % پایان زمان‌سنجی

% نمایش نتایج
fprintf('زمان محاسبه همبستگی full: %.6f ثانیه\n', full_time);
fprintf('زمان محاسبه همبستگیsame : %.6f ثانیه\n', same_time);
fprintf('پیجیدگی  %d \n', complexity);

% نمایش تصاویر
figure;

subplot(1, 3, 1);
imshow(image);
title('تصویر اصلی');
axis off;

subplot(1, 3, 2);
imshow(full_correlation, []);
title('full',full_time);
axis off;

subplot(1, 3, 3);
imshow(same_correlation, []);
title('same',same_time);
axis off;