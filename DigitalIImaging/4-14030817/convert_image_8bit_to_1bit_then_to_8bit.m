clc;
clear all;
close all;

myPic='pic/dollar.bmp';
% بارگذاری تصویر
mainImage = imread(myPic); % نام فایل تصویر ورودی
info = imfinfo(myPic)

% نمایش بخش‌ها در یک figure
figure;


% اطمینان از اینکه تصویر رنگی است
if size(mainImage, 3) == 3
    I = rgb2gray(mainImage); % تبدیل به تصویر خاکستری
else
    I = mainImage; % تبدیل به تصویر خاکستری
end

% ردیف اول: نمایش تصویر اصلی
subplot(3, 9, 1); 
imshow(mainImage); % نمایش تصویر اصلی
title('تصویر اصلی');


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
    imwrite(bitImage , sprintf('pic/test_bit_dollar_%d.png', i)); % ذخیره تصویر یک بیتی

    %Step2
    subplot(3, 9, i+10); 
    imshow(bitImage); 
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
cSum='+';
str_title='';
for i = 0:7
    bitImage = imread(sprintf('pic/test_bit_dollar_%d.png', i)); % بارگذاری تصویر یک بیتی
    combinedImage = combinedImage + bitshift(uint8(bitImage > 0), i); % ترکیب تصاویر

    %Step2
    subplot(3, 9, i+20); 
    imshow(combinedImage);
    
    str_title = [str_title, cSum, num2str(i+1)];
    title(str_title); % عنوان بخش
    %Step2
end

% ذخیره تصویر هشت بیتی
imwrite(combinedImage, 'pic/test_combined_dollar.png');



% ردیف اول: نمایش تصویر اصلی
I = imread('pic/test_combined_dollar.png'); 
subplot(3, 9, 27); 
imshow(I);
title('تضویر مجموع شده');

subplot(3, 9, 3); 
imshow(I);
title('تضویر مجموع شده');



disp('هشت تصویر یک بیتی ذخیره شدند و تصویر هشت بیتی ذخیره گردید.');


%test 1
figure;

% ردیف اول: نمایش تصویر اصلی
subplot(3, 8, 1); 
imshow(mainImage); % نمایش تصویر اصلی
title('تصویر اصلی');


% ردیف اول: نمایش تصویر اصلی
subplot(3, 8, 2); 
imshow(I); % نمایش تصویر اصلی
title('تصویر خاکستری');

combinedImage = zeros(size(I), 'uint8');
s=8;
str_title='';
for i = 0:7
    s=s+1;
    if(i==0 || i==2 || i==4 || i==6)
        bitImage = imread(sprintf('pic/test_bit_dollar_%d.png', i)); % بارگذاری تصویر یک بیتی
        combinedImage = combinedImage + bitshift(uint8(bitImage > 0), i); % ترکیب تصاویر

        %Step2
        subplot(4, 8, s); 
        imshow(combinedImage); 
        str_title = [str_title, cSum, num2str(i+1)];
        title(str_title); % عنوان بخش
        %Step2
    end     
end
imwrite(combinedImage, 'pic/test_combined_dollar_1_3_5_7.png');
%test 2
combinedImage = zeros(size(I), 'uint8');
str_title='';
for i = 0:7
    s=s+1;
    if(i==1 || i==3 || i==5 || i==7)
        bitImage = imread(sprintf('pic/test_bit_dollar_%d.png', i)); % بارگذاری تصویر یک بیتی
        combinedImage = combinedImage + bitshift(uint8(bitImage > 0), i); % ترکیب تصاویر

        %Step2
        subplot(4, 8, s); 
        imshow(combinedImage);
        str_title = [str_title, cSum, num2str(i+1)];
        title(str_title); % عنوان بخش
        %Step2
    end     
end
imwrite(combinedImage, 'pic/test_combined_dollar_2_4_6_8.png');
%test 3
combinedImage = zeros(size(I), 'uint8');
str_title='';
for i = 0:7
    s=s+1;
    if(i==5 || i==6 || i==7)
        bitImage = imread(sprintf('pic/test_bit_dollar_%d.png', i)); % بارگذاری تصویر یک بیتی
        combinedImage = combinedImage + bitshift(uint8(bitImage > 0), i); % ترکیب تصاویر

        %Step2
        subplot(4, 8, s); 
        imshow(combinedImage);
        str_title = [str_title, cSum, num2str(i+1)];
        title(str_title); % عنوان بخش
        %Step2
    end     
end
imwrite(combinedImage, 'pic/test_combined_dollar_6_7_8.png');