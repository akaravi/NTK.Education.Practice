clc;
clear all;
close all;

function fib = fibfunc(n)
    if n <= 0
        fib = 0; % دنباله فیبوناچی برای n=0
    elseif n == 1
        fib = 1; % دنباله فیبوناچی برای n=1
    else
        fib = fibfunc(n-1) + fibfunc(n-2); % بازگشت برای n بزرگتر از 1
    end
end

% دریافت ورودی از کاربر
n = input('لطفاً یک عدد صحیح مثبت وارد کنید: \n');

% بررسی ورودی
if n < 0
    disp('لطفاً یک عدد صحیح مثبت وارد کنید.');
else
    result = fibfunc(n);
    fprintf('عدد %d در دنباله فیبوناچی برابر است با: %d\n', n, result);
end
