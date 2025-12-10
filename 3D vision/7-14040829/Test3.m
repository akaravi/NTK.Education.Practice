% Written By Sajad Farokhi, IAUN, Dec. 2016
% Email: sajjad_farokhi@yahoo.com
% Internal boundary

clc
clear
close all


bw = imread('23.bmp');
se = strel('square', 3); %Square SE%

re=imerode(bw,se);
rd=imdilate(bw,se);

B_Int=bw&~re;
B_ext=rd&~bw;
B_grad=rd&~re;

%% Show results
subplot(2,4,1),imshow(bw),title('Original image');
subplot(2,4,2),imshow(re),title('imerode');
subplot(2,4,3),imshow(rd),title('imdilate');



set(gcf,'units','normalized','outerposition',[0 0 1 1])
subplot(2,4,5),imshow(bw),title('Original image');
subplot(2,4,6),imshow(B_Int),title('Internal Boundry');
subplot(2,4,7),imshow(B_ext),title('External Boundry');
subplot(2,4,8),imshow(B_grad),title('Morphological gradient');