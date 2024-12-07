cls;
clear all;
close all;
img = imread('cameraman.tif'); 


if size(img, 3) == 3
    img = rgb2gray(img);
end

% Display the original image
figure;
subplot(2,2,1);
imshow(img);
title('Original Image');

% Add Gaussian Noise
gaussianNoiseImg = imnoise(img, 'gaussian', 0, 0.01);
subplot(2,2,2);
imshow(gaussianNoiseImg);
title('Gaussian Noise');

% Add Salt & Pepper Noise
saltPepperNoiseImg = imnoise(img, 'salt & pepper', 0.02);
subplot(2,2,3);
imshow(saltPepperNoiseImg);
title('Salt & Pepper Noise');

% Add Speckle Noise
speckleNoiseImg = imnoise(img, 'speckle', 0.04);
subplot(2,2,4);
imshow(speckleNoiseImg);
title('Speckle Noise');

% Save images if needed
imwrite(gaussianNoiseImg, 'gaussian_noise_image.jpg');
imwrite(saltPepperNoiseImg, 'salt_pepper_noise_image.jpg');
imwrite(speckleNoiseImg, 'speckle_noise_image.jpg');