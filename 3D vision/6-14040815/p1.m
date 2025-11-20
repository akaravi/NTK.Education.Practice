clc 
clear
close all

t_x= 10;
t_y= 50;
img = imread('cameraman.tif');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%روش اول
t_img1 = imtranslate(img, [t_x, t_y]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%روش دوم
T = [1 0 0; 0 1 0; t_x t_y 1];   % ماتریس انتقال
tform = affine2d(T);
i_f=imref2d(size(img))
t_img2 = imwarp(img, tform, 'OutputView', i_f);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%با کد نویسی
[rows, cols, channels] = size(img);
t_img3 = zeros(rows, cols, channels, class(img));
for y = 1:rows
    for x = 1:cols
        x_new = x + t_x; 
        y_new = y + t_y; 
        
        % بررسی اینکه آیا موقعیت جدید در محدوده تصویر است
        if x_new <= cols && y_new <= rows
            t_img3(y_new, x_new, :) = img(y, x, :);
        end
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure;
subplot(1,4,1);
imshow(img);
title('تصویر اصلی');
subplot(1,4,2);
imshow(t_img1);
title(['تصویر منتقل شده (10 راست، 50 پایین)' 'imtranslate']);
subplot(1,4,3);
imshow(t_img2);
title(['تصویر منتقل شده (10 راست، 50 پایین)' 'imwarp']);
subplot(1,4,4);
imshow(t_img3);
title(['تصویر منتقل شده (10 راست، 50 پایین)' 'کد نویسی']);