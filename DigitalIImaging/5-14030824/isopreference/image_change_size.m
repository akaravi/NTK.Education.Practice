clc
clear all
close all
% Array of image filenames
imageFiles = {'cameraman.jpg', 'lena.jpg', 'crowd.jpg'};

% Define new sizes for resizing
newSizes = [128, 128; 64, 64; 32, 32];

% Loop through each image
for j = 1:length(imageFiles)
    % Load the image
    originalImage = imread(imageFiles{j});
    
    % Display original image
    figure;
    imshow(originalImage);
    title(['Original Image - ', imageFiles{j}]);
    
    % Loop through each size, resize the image, and save the result
    for i = 1:size(newSizes, 1)
        % Resize the image
        resizedImage = imresize(originalImage, [newSizes(i, 1), newSizes(i, 2)]);
        
        % Display resized image
        figure;
        imshow(resizedImage);
        title(['Resized Image - ', imageFiles{j}, ' - Size: ', num2str(newSizes(i, :))]);
        
        % Save the resized image
        filename = ['run/',imageFiles{j}(1:end-4), '_resized_', num2str(newSizes(i, 1)), 'x', num2str(newSizes(i, 2)), '.png'];
        imwrite(resizedImage,filename);
    end
end