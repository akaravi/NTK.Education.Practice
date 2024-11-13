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
        pause(1);


        % نمایش تصویر ترکیبی
        imshow(combinedImage);
        title('در حال تجمیع شدن');
    end


    % نمایش تصویر ترکیبی
    imshow(combinedImage);
    title('تصویر ۸ بیتی ترکیبی');
    
    % ذخیره تصویر ترکیبی
    imwrite(combinedImage, 'test_combined_dollar_method2.png');
end
% نام فایل‌های تصاویر ۱ بیتی
imageFiles = {
    'pic/test_bit_dollar_0.png',
    'pic/test_bit_dollar_1.png',
    'pic/test_bit_dollar_2.png',
    'pic/test_bit_dollar_3.png', 
    'pic/test_bit_dollar_4.png',
    'pic/test_bit_dollar_5.png',
    'pic/test_bit_dollar_6.png',
    'pic/test_bit_dollar_7.png'
};

% فراخوانی تابع
combineBinaryImagesTo8BitImage(imageFiles);
% info = imfinfo('pic/test_bit_dollar_0.png')
% info = imfinfo('pic/test_combined_dollar_1_3_5_7.png')
% info = imfinfo('pic/test_combined_dollar_6_7_8.png')
