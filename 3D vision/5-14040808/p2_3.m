clc 
clear
close all


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
D0_array = [10, 20, 30, 40, 50]; % مقادیر مختلف D0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Load Image
f=imread('car.jpg');
f = rgb2gray(f); 
f=im2double(f);
[m,n]=size(f);

%% FFT
F=fft2(f,2*m,2*n);
[M,N]=size(F);

figure;
for i = 1:length(D0_array)
    D0 = D0_array(i); % مقدار D0 فعلی
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%D0=50;
    order=2;
    H1= lpfilter('ideal',M,N,D0);
    H2= lpfilter('btw',M,N,D0,order);
    H3= lpfilter('gaussian',M,N,D0);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %% Perform Filtering
    g1 = dftfilt2(F,H1,m,n);
    g2 = dftfilt2(F,H2,m,n);
    g3 = dftfilt2(F,H3,m,n);

    %% Show Results
    %%set(gcf,'units','normalized','outerposition',[0 0 1 1])
    subplot(length(D0_array)+2, 6, i*6 +1);imshow(g1);title(['Ideal highpass filter with \it D_0 =' num2str(D0)])
    subplot(length(D0_array)+2, 6, i*6 +3);imshow(g2);title(['BW highpass filter with \it D_0 =' num2str(D0) ' and order  =' num2str(order)])
    subplot(length(D0_array)+2, 6, i*6 +5);imshow(g3);title(['Gaussian highpass filter with \it D_0 =' num2str(D0)])   

    % رسم هیستوگرام تصویر فیلتر شده
    subplot(length(D0_array)+2, 6, i*6 +2);title(['Ideal highpass filter with \it D_0 =' num2str(D0)])
    imhist(im2uint8(g1), 256);
    title(['Histogram  (D0 = ', num2str(D0), ')']);
    xlabel('Pixel Intensity');
    ylabel('Frequency');

        % رسم هیستوگرام تصویر فیلتر شده
    subplot(length(D0_array)+2, 6, i*6 +4);title(['BW highpass filter with \it D_0 =' num2str(D0) ' and order  =' num2str(order)])
    imhist(im2uint8(g2), 256);
    title(['Histogram  (D0 = ', num2str(D0), ')']);
    xlabel('Pixel Intensity');
    ylabel('Frequency');

        % رسم هیستوگرام تصویر فیلتر شده
    subplot(length(D0_array)+2, 6, i*6 +6);title(['Gaussian highpass filter with \it D_0 =' num2str(D0)])   
    imhist(im2uint8(g3), 256);
    title(['Histogram  (D0 = ', num2str(D0), ')']);
    xlabel('Pixel Intensity');
    ylabel('Frequency');


end