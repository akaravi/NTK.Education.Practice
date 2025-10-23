clc
clear
close all
f=im2double(imread('rice.png'));
m=mean2(f);
f2=f-m;
F=fft2(f);
F(1,1)=0;
fhat=ifft2(F);
max(abs(f2(:)-fhat(:)))
%% Show results
subplot(1,3,1),imshow(f);
subplot(1,3,2),imshow(f2);
subplot(1,3,3),imshow(fhat);