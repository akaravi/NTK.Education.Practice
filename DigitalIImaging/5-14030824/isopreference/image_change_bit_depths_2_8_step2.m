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
    
    % Create a new figure for each image
    figure;
    
    % Display original image
    subplot(2, 1, 1); % Divide the figure into a 2x1 grid, and use the first cell
    imshow(originalImage);
    title(['Original Image - ', imageFiles{j}]);
    ی
    % Create a subplot for the combined histogram
    subplot(2, 1, 2); % Use the second cell of the 2x1 grid
    hold on;
    title(['Histogram for ', imageFiles{j}]);
    xlabel('Pixel Intensity');
    ylabel('Number of Pixels');
    xlim([32, 256]);
    
    % Loop through each bit depth
    for i = 1:length(bitDepths)
        % Calculate the number of levels
        levels = 2^bitDepths(i);
        
        % Quantize the image to the new bit depth
        quantizedImage = round(double(originalImage) / 256 * levels) * (256 / levels);
        
        % Convert back to uint8
        quantizedImage = uint8(quantizedImage);
        
        % Save the quantized image
        filename = [imageFiles{j}(1:end-4), '_', num2str(bitDepths(i)), 'bit.png'];
        imwrite(quantizedImage, filename);
        
        % Calculate histogram
        histogramData = imhist(quantizedImage, levels);
        
        % Plot histogram
        plot(0:levels-1, histogramData, 'DisplayName', ['Bit Depth: ', num2str(bitDepths(i))]);
    end
    
    legend('show');
    hold off;
end