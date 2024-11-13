clc;
clear all;
close all;

% دریافت مسیر فولدر از کاربر
folder_path = uigetdir('','فولدر را انتخاب کنید');

% افزودن فولدر اصلی به مسیر جستجو
addpath(folder_path);

% افزودن ساب‌فولدرها به مسیر جستجو
subfolders = genpath(folder_path);
addpath(subfolders);

% نمایش پیام تایید
fprintf('فولدر  به مسیر جستجو اضافه شدند: \n%s\n', folder_path);
fprintf(' ساب‌فولدرها به مسیر جستجو اضافه شدند: \n%s\n', subfolders);