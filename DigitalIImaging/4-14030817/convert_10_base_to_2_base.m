clc;
clear all;
close all;

% ورودی عدد مبنای 10
number_base10 = input('عدد مبنای 10 را وارد کنید: ');

% تبدیل به مبنای 2
number_base2 = dec2bin(number_base10);

% نمایش نتیجه
fprintf('عدد %d در مبنای 2 برابر است با: %s\n', number_base10, number_base2);
%fprintf('عدد در مبنای ۱۰: %d\n', number_base2);