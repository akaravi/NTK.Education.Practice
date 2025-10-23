% Written By Sajad Farokhi, IAUN, Dec. 2016
% Email: sajjad_farokhi@yahoo.com

clc
clear
close all


[x,y]=meshgrid(-128:217,-128:127);
z=sqrt(x.^2+y.^2);

c=1./(1+(z./15).^2);

cf=fftshift(fft2(double(c)));

%% Show results
set(gcf,'units','normalized','outerposition',[0 0 1 1])
subplot(1,2,1),surf(double(c(1:5:end,1:5:end))),title('Original Image');
subplot(1,2,2),fftshow(cf,'log'),title('Specturum of Image');




