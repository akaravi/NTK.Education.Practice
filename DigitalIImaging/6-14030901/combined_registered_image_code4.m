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
% تنظیم optimizer و metric
[optimizer, metric] = imregconfig('monomodal');
% ثبت تصاویر
tform12 = imregtform(img2_gray, img1_gray, 'affine', optimizer, metric);
output_img12 = imwarp(img2, tform12, 'OutputView', imref2d(size(img1)));

tform13 = imregtform(img3_gray, img1_gray, 'affine', optimizer, metric);
output_img13 = imwarp(img3, tform13, 'OutputView', imref2d(size(img1)));

tform14 = imregtform(img4_gray, img1_gray, 'affine', optimizer, metric);
output_img14 = imwarp(img4, tform14, 'OutputView', imref2d(size(img1)));

% ترکیب تصاویر برای ایجاد پانوراما
% ابتدا تصویر اول
panorama = img1;

% اضافه کردن تصویر دوم
panorama = stitchImages(panorama, output_img12);

% اضافه کردن تصویر سوم
panorama = stitchImages(panorama, output_img13);

% اضافه کردن تصویر چهارم
panorama = stitchImages(panorama, output_img14);

% ذخیره تصویر پانوراما
imwrite(panorama, 'panorama_image.jpg');

% نمایش تصویر پانوراما
figure;
imshow(panorama);
title('Panorama Image');

function stitched = stitchImages(baseImg, newImg)
    % ترکیب دو تصویر
    % به دست آوردن ویژگی‌ها
    basePoints = detectSURFFeatures(rgb2gray(baseImg));
    newPoints = detectSURFFeatures(rgb2gray(newImg));

    % استخراج ویژگی‌ها
    [baseFeatures, baseValidPoints] = extractFeatures(rgb2gray(baseImg), basePoints);
    [newFeatures, newValidPoints] = extractFeatures(rgb2gray(newImg), newPoints);

    % تطبیق ویژگی‌ها
    indexPairs = matchFeatures(baseFeatures, newFeatures);
    baseMatched = baseValidPoints(indexPairs(:, 1));
    newMatched = newValidPoints(indexPairs(:, 2));

    % به دست آوردن ماتریس تبدیل
    tform = estimateGeometricTransform(newMatched, baseMatched, 'affine');
    
    % اعمال تبدیل
    outputImg = imwarp(newImg, tform, 'OutputView', imref2d(size(baseImg)));

    % ترکیب تصاویر
    stitched = max(baseImg, outputImg);
end