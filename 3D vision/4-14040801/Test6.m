% Written By Sajad Farokhi, IAUN, May. 2016
% Email: sajjad_farokhi@yahoo.com

clc % Clear the command window
clear % Clear the workspace
close all % Close all Figures

addpath('Functions', 'Images')

%%
M=50;
N=50;
[U,V]=dftuv(M,N);
D=hypot(U,V);% Euclidean distance

D=fftshift(D);

D0=5;

LP=(D<D0);% Logical Array
LP=double(LP);% Change the class to double
LP=lpfilter('ideal',M,N,D0);
%% Show Filter
set(gcf,'units','normalized','outerposition',[0 0 1 1])
mesh(LP),axis tight,colormap('gray'),axis off
title(['Ideal lowpass filter \it D_0 =' num2str(D0)]);
view(-30,40)
%imshow(LP)