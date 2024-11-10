clc;
clear all;
close all;

function combineBinaryImagesTo8BitImage(imageFiles)
    % بررسی اینکه تعداد ورودی‌ها برابر با 8 باشد
    if length(imageFiles) ~= 8
        error('باید دقیقاً 8 تصویر ۱ بیتی ورودی داده شود.');
    end

    % ایجاد یک تصویر ۸ بیتی خالی
    combinedImage = zeros(1, 1, 'uint8');

    % بارگذاری و ترکیب تصاویر
    for i = 1:8
        % بارگذاری تصویر ۱ بیتی
        binaryImage = imread(imageFiles{i});
        
        % بررسی اینکه تصویر ۱ بیتی باشد
        if ~islogical(binaryImage)
            error('تصویر %d باید یک تصویر ۱ بیتی باشد.', i);
        end
        
        % تبدیل تصویر ۱ بیتی به ۸ بیتی (با استفاده از شیفت)
        combinedImage = bitset(combinedImage, i, binaryImage);
    end

    % نمایش تصویر ترکیبی
    imshow(combinedImage);
    title('تصویر ۸ بیتی ترکیبی');
    
    % ذخیره تصویر ترکیبی
    imwrite(combinedImage, 'combinedImage.png');
end
% نام فایل‌های تصاویر ۱ بیتی
imageFiles = {
    'image1.png', 'image2.png', 'image3.png', 'image4.png', 
    'image5.png', 'image6.png', 'image7.png', 'image8.png'
};

% فراخوانی تابع
combineBinaryImagesTo8BitImage(imageFiles);
