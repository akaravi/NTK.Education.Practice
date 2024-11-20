clc
clear all
close all

% Array of image filenames
imageFiles = {'cameraman.jpg', 'lena.jpg', 'crowd.jpg'};

% Define scale factors for downsampling
scaleFactors = [0.5, 0.25, 0.1];

% Loop through each image
for j = 1:length(imageFiles)
    % Load the image
    originalImage = imread(imageFiles{j});
    
    % Display original image
    figure;
    imshow(originalImage);
    title(['Original Image - ', imageFiles{j}]);
    
    % Loop through each scale factor, downsample the image, and save the result
    for i = 1:length(scaleFactors)
        % Downsample the image
        downsampledImage = imresize(originalImage, scaleFactors(i));
        
        % Display downsampled image
        figure;
        imshow(downsampledImage);
        title(['Downsampled Image - ', imageFiles{j}, ' - Scale Factor: ', num2str(scaleFactors(i))]);
        
        % Save the downsampled image
        filename = [imageFiles{j}(1:end-4), '_downsampled_', num2str(scaleFactors(i)), '.jpg'];
        imwrite(downsampledImage, filename);
    end
end