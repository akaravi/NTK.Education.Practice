clc
clear all
close all
% Array of image filenames
imageFiles = {'cameraman.jpg', 'lena.jpg', 'crowd.jpg'};
% Loop through each image
for j = 1:length(imageFiles)
    imfinfo(imageFiles{j})

end
