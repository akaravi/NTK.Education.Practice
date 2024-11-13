clc;
clear all;
close all;

% ورودی عدد مبنای2 
% s برای تبدیل عدد به رشته 
number_base2 = input('عدد مبنای 2 را وارد کنید: \n', 's');

% تبدیل به مبنای 10
number_base10 = bin2dec(number_base2);

% نمایش نتیجه
fprintf('عدد در مبنای ۱۰: %d\n', number_base10);

