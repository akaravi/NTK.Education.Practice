clc
clear
close all
f=im2double(imread('rice.png'));
F=fft2(f);
F(1,1)=0;
fhat=ifft2(F);
%% Show results
subplot(1,2,1),imshow(f);
subplot(1,2,2),imshow(fhat);