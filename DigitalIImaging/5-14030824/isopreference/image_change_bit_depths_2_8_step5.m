clc
clear all
close all
% بارگذاری عکس‌ها
img_low = imread('cameraman.jpg'); % عکس با جزییات کم
img_medium = imread('lena.jpg'); % عکس با جزییات متوسط
img_high = imread('crowd.jpg'); % عکس با جزییات زیاد

% مشخصات
scale_factors = linspace(256, 24, 5); % مقیاس‌های پیکسل
images = {img_low, img_medium, img_high};
titles = {'Low Detail', 'Medium Detail', 'High Detail'};

% شکل برای نمایش تصاویر و نمودارها
figure('Name', 'Image and Pixel Variation Analysis');

for j = 1:length(images)
    total_pixels = zeros(1, length(scale_factors));
    for i = 1:length(scale_factors)
        % تغییر اندازه تصویر
        resized_img = imresize(images{j}, scale_factors(i)/256);
        
        % محاسبه تعداد کل پیکسل‌ها
        total_pixels(i) = numel(resized_img);
        
        % نمایش تصویر تغییر یافته
        subplot(length(images), length(scale_factors)+1, (j-1)*(length(scale_factors)+1) + i);
        imshow(resized_img);
        title(['N = ' num2str(scale_factors(i))]);
    end
    
    % نمایش تصویر اصلی
    subplot(length(images), length(scale_factors)+1, j*(length(scale_factors)+1));
    imshow(images{j});
    title('Original');
end

% نمایش نمودار تغییرات تعداد پیکسل‌ها
figure('Name', 'Pixel Variation Plots');
for j = 1:length(images)
    subplot(1, 3, j);
    plot(scale_factors, total_pixels, '-o', 'LineWidth', 1.5);
    set(gca, 'XDir', 'reverse'); % معکوس کردن محور X برای مطابقت با نمودار نمونه
    xlabel('N (Pixels per Inch)');
    ylabel('Total Pixels');
    title(titles{j});
    grid on;
end

% ذخیره شکل‌ها
saveas(figure(1), 'image_comparison.png');
saveas(figure(2), 'pixel_variation_plot.png');