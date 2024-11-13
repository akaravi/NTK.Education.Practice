clc;
clear all;
close all;

% انتخاب تصویر از کاربر
[filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp;*.tif', 'Image Files (*.jpg, *.png, *.bmp, *.tif)'}, 'Select an Image');
if isequal(filename, 0)
    disp('User selected Cancel');
else
  
    % بارگذاری تصویر
    %img = imread(myPic); % نام فایل تصویر ورودی
    % خواندن تصویر
    img = imread(fullfile(pathname, filename));
    info = imfinfo(fullfile(pathname, filename))

    % نمایش بخش‌ها در یک figure
    figure;

    % نمایش تصویر اصلی
    %subplot(2, 4, 1);
    imshow(img);
    title('Original Image');

    % نمایش تصویر خاکستری
    gray_img = rgb2gray(img);
    figure;
    %subplot(2, 4, 2);
    imshow(gray_img);
    title('Grayscale Image');

    % لیست color map ها
    colormaps = {'jet', 'hsv', 'hot', 'cool', 'gray', 'parula'};

    % نمایش تصویر با color map های مختلف

    for i = 1:length(colormaps)
        figure;
        %subplot(2, 4, i + 2); % از ردیف 1 و ستون 3 شروع می‌شود
        % استفاده از imagesc برای نمایش با رنگ‌ها
        imshow(gray_img, []); % نمایش تصویر خاکستری
        colormap(colormaps{i}); % اعمال color map
        colorbar; % اضافه کردن نوار رنگ
        title(colormaps{i});
        pause(1); % توقف به مدت 1 ثانیه برای مشاهده تغییرات
    end
end