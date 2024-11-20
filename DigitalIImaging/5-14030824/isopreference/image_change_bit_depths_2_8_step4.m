clc
clear all
close all
% بارگذاری عکس‌ها
img_low = imread('cameraman.jpg'); % عکس با جزییات کم
img_medium = imread('lena.jpg'); % عکس با جزییات متوسط
img_high = imread('crowd.jpg'); % عکس با جزییات زیاد

% مشخصات
scale_factors = [256, 128, 64, 32, 24]; % مقیاس‌های پیکسل
num_images = length(scale_factors);
images = {img_low, img_medium, img_high};
titles = {'Low Detail', 'Medium Detail', 'High Detail'};

% ذخیره عکس‌های تغییر یافته و نمودارها
figure;

for i = 1:num_images
    for j = 1:length(images)
        % تغییر اندازه تصویر
        resized_img = imresize(images{j}, scale_factors(i)/256);
        
        % نمایش تصویر
        subplot(num_images, length(images), (i-1)*length(images) + j);
        imshow(resized_img);
        title([titles{j} ' - ' num2str(scale_factors(i)) ' pixels/inch']);
        axis image;
        
        % ذخیره عکس تغییر یافته
        imwrite(resized_img, ['resized_' titles{j} '_' num2str(scale_factors(i)) '.jpg']);
    end
end

% نمودار تغییرات تعداد پیکسل
total_pixels = zeros(num_images, num_images);

for j = 1:length(images)
    for i = 1:num_images
        resized_img = imresize(images{j}, scale_factors(i)/256);
        total_pixels(j, i) = numel(resized_img);
    end
end

figure;
hold on;
for j = 1:length(images)
    plot(scale_factors, total_pixels(j, :), 'DisplayName', titles{j});
end
hold off;

xlabel('Number of Pixels per Inch');
ylabel('Total Pixels');
title('Total Pixels Variation');
legend show;
grid on;

% ذخیره نمودار
saveas(gcf, 'pixel_variation_plot.png');

% مقایسه بصری
figure;
for j = 1:length(images)
    subplot(1, 3, j);
    imshow(images{j});
    title(titles{j});
end
saveas(gcf, 'visual_comparison.png');