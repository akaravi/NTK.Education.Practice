clc;
clear all;
close all;

% ورودی عدد مبنای2 
number_base2 = input('عدد مبنای 2 را وارد کنید: ', 's');
%number_base2 = '10';

% تبدیل به مبنای 10
number_base10 = bin2dec(number_base2);

% نمایش نتیجه
fprintf('عدد در مبنای ۱۰: %d\n', number_base10);