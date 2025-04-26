clc
clear
close all


function output = karavi_ordfilt2(input, nsize)
    if mod(nsize, 2) == 0
        error('اندازه همسایگی باید عدد فرد باشد.');
    end
    pad_size = floor(nsize / 2);
    padded_image = padarray(input, [pad_size, pad_size], 'replicate');
    output = zeros(size(input));

    for i = 1:size(input, 1)
        for j = 1:size(input, 2)
            % استخراج همسایگی
            nnn = padded_image(i:i + nsize - 1, j:j + nsize - 1);
            % محاسبه میانه
            output(i, j) = median(nnn(:));
        end
    end
    %output = uint8(output);
end
image =im2double( imread('cameraman.tif'));
image_by_myfilter = karavi_ordfilt2(image, 3); 
image_by_main_filter = medfilt2(image, [3 3]); 


figure;
subplot(1, 3, 1);
imshow(image);
title('تصویر اصلی');

subplot(1, 3, 2);
imshow(image_by_main_filter);
title('تصویر با فیلتر میانه اصلی');

subplot(1, 3, 3);
imshow(image_by_myfilter);
title('تصویر با فیلتر میانه من');