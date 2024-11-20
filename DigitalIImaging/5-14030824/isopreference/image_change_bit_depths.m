clc
clear all
close all
% Array of image filenames
imageFiles = {'cameraman.jpg', 'lena.jpg', 'crowd.jpg'};

% Define new bit depths
bitDepths = [8, 4, 2,1];

% Loop through each image
for j = 1:length(imageFiles)
    % Load the image
    originalImage = imread(imageFiles{j});
    
    % Display original image
    figure;
    imshow(originalImage);
    title(['Original Image - ', imageFiles{j}]);
    
    % Loop through each bit depth, change bit depth, and save the result
    for i = 1:length(bitDepths)
        % Calculate the number of levels
        levels = 2^bitDepths(i);
        
        % Quantize the image to the new bit depth
        quantizedImage = round(double(originalImage) / 256 * levels) * (256 / levels);
        
        % Convert back to uint8
        quantizedImage = uint8(quantizedImage);
        
        % Display quantized image
        figure;
        imshow(quantizedImage);
        title(['Quantized Image - ', imageFiles{j}, ' - Bit Depth: ', num2str(bitDepths(i))]);
        
        % Save the quantized image
        filename = ['run/',imageFiles{j}(1:end-4), '_quantized_', num2str(bitDepths(i)), 'bit.png'];
        imwrite(quantizedImage, filename);
    end
end