clc
clear all
close all
% Array of image filenames
imageFiles = {'cameraman.jpg', 'lena.jpg', 'crowd.jpg'};

% Define new bit depths
bitDepths = 2:8;

% Loop through each image
for j = 1:length(imageFiles)
    % Load the image
    originalImage = imread(imageFiles{j});
    
    % Display original image
    figure;
    imshow(originalImage);
    title(['Original Image - ', imageFiles{j}]);
    
    % Loop through each bit depth
    for i = 1:length(bitDepths)
        % Calculate the number of levels
        levels = 2^bitDepths(i);
        
        % Quantize the image to the new bit depth
        quantizedImage = round(double(originalImage) / 256 * levels) * (256 / levels);
        
        % Convert back to uint8
        quantizedImage = uint8(quantizedImage);
        
        % Calculate histogram
        histogramData = imhist(quantizedImage, levels);
        
        % Plot histogram with specified range
        figure;
        bar(0:levels-1, histogramData);
        title(['Histogram - ', imageFiles{j}, ' - Bit Depth: ', num2str(bitDepths(i))]);
        xlabel('Pixel Intensity');
        ylabel('Number of Pixels');
        xlim([32, 256]);
        ylim([0, max(histogramData)]);
    end
end