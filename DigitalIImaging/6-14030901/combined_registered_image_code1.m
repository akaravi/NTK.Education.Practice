clc;
close all;
clear all;
% بارگذاری تصاویر
img1 = imread('image1.jpg');
img2 = imread('image2.jpg');
img3 = imread('image3.jpg');
img4 = imread('image4.jpg');
% تبدیل تصاویر به خاکستری (در صورت نیاز)
img1_gray = rgb2gray(img1);
img2_gray = rgb2gray(img2);
img3_gray = rgb2gray(img3);
img4_gray = rgb2gray(img4);
%تصاویر با شدت روشنایی مشابه 
%monomodal
%مولتی
%multimodal
[optimizer, metric] = imregconfig('monomodal');
% ثبت تصویر 1 و 2
output_img12 = imregister(img2_gray, img1_gray, 'affine', optimizer, metric);
imwrite(output_img12, 'registered_img12.jpg');
% ثبت تصویر 3 بر روی تصویر 1
output_img13 = imregister(img3_gray, img1_gray, 'affine', optimizer, metric);
imwrite(output_img13, 'registered_img13.jpg');
% ثبت تصویر 4 بر روی تصویر 1
output_img14 = imregister(img4_gray, img1_gray, 'affine', optimizer, metric);
imwrite(output_img14, 'registered_img14.jpg');
% متصل کردن تصاویر ثبت شده
combined_image = cat(1,img1_gray, output_img12, output_img13, output_img14); 
% ذخیره تصویر متصل شده
imwrite(combined_image, 'combined_registered_image.jpg');
% نمایش تصاویر ثبت شده
figure;
subplot(1,4,1), imshow(img1_gray), title('Registered Image 1');
subplot(1,4,2), imshow(output_img12), title('Registered Image 2');
subplot(1,4,3), imshow(output_img13), title('Registered Image 3');
subplot(1,4,4), imshow(output_img14), title('Registered Image 4');
% نمایش تصویر متصل شده
figure;
imshow(combined_image);
title('Combined Registered Images');