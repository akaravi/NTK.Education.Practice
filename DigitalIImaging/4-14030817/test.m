clc;
clear all;
close all;

myPic='pic/dollar.bmp';
% بارگذاری تصویر
I = imread(myPic); % نام فایل تصویر ورودی
info = imfinfo(myPic)

% نمایش بخش‌ها در یک figure
figure;

% ردیف اول: نمایش تصویر اصلی
subplot(3, 9, 1); 
imshow(I); % نمایش تصویر اصلی
title('تصویر اصلی');


% اطمینان از اینکه تصویر رنگی است
if size(I, 3) == 3
    I = rgb2gray(I); % تبدیل به تصویر خاکستری
end



% ردیف اول: نمایش تصویر اصلی
subplot(3, 9, 2); 
imshow(I); % نمایش تصویر اصلی
title('تصویر خاکستری');


% تبدیل تصویر به uint8
%I = uint8(I);

% ذخیره هشت تصویر یک بیتی
for i = 0:7
    % استخراج بیت i
    bitImage = bitand(I, uint8(2^i)) > 0; % گرفتن بیت i
    imwrite(uint8(bitImage) * 255, sprintf('pic/test_bit_dollar_%d.bmp', i)); % ذخیره تصویر یک بیتی

    %Step2
    subplot(3, 9, i+10); 
    imshow(bitImage); % نمایش تصویر یک بیتی (تبدیل به مقادیر 0 و 255)
    title(sprintf('بخش %d', i+1)); % عنوان بخش
    %Step2
    pause(1); % توقف به مدت 1 ثانیه برای مشاهده تغییرات
end

% بارگذاری هشت تصویر یک بیتی و ترکیب آن‌ها به یک تصویر هشت بیتی
combinedImage = zeros(size(I), 'uint8'); % تصویر نهایی


%Step
subplot(3, 9, 19); 
imshow(combinedImage); % نمایش تصویر یک بیتی (تبدیل به مقادیر 0 و 255)
title('عکس با آرایه صفر'); % عنوان بخش
%Step


for i = 0:7
    bitImage = imread(sprintf('pic/test_bit_dollar_%d.bmp', i)); % بارگذاری تصویر یک بیتی
    combinedImage = combinedImage + bitshift(uint8(bitImage > 0), i); % ترکیب تصاویر

    %Step2
    subplot(3, 9, i+20); 
    imshow(combinedImage); % نمایش تصویر یک بیتی (تبدیل به مقادیر 0 و 255)
    title(sprintf('مجموع %d', i+1)); % عنوان بخش
    %Step2
end

% ذخیره تصویر هشت بیتی
imwrite(combinedImage, 'pic/test_combined_dollar.bmp');



% ردیف اول: نمایش تصویر اصلی
I = imread('pic/test_combined_dollar.bmp'); 
subplot(3, 9, 27); 
imshow(I);
title('تضویر مجموع شده');

subplot(3, 9, 3); 
imshow(I);
title('تضویر مجموع شده');



disp('هشت تصویر یک بیتی ذخیره شدند و تصویر هشت بیتی ذخیره گردید.');