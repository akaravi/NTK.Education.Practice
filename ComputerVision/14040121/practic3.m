clc
clear
close all
% بارگذاری تصویر
image =im2double( imread('rice.png'));

% تعریف سایزهای مختلف برای فیلتر میانگین
sizes = [3, 5, 7, 9,15]; % سایزهای مختلف برای فیلتر میانگین

% ایجاد یک پنجره برای نمایش تصاویر
figure;

% نمایش تصویر اصلی
subplot(2, 3, 1);
imshow(image);
title('تصویر اصلی');
axis off;
for i = 1:length(sizes)
    % ایجاد کرنل میانگین با اندازه مناسب
    kernel_size = sizes(i);
    mean_kernel = ones(kernel_size) / (kernel_size^2); % کرنل میانگین

    % اعمال فیلتر میانگین با imfilter
    f_image = imfilter(image, mean_kernel, 'replicate');

    % نمایش تصویر
    subplot(2, 3, i+1);
    imshow(f_image);
    title(['filtter (Size = ', num2str(kernel_size), ')']);
    axis off;
end
