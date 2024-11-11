clc;
clear all;
close all;

function setOuterPosition(positions)
    % بررسی اینکه ورودی یک ماتریس است یا خیر
    if ~isnumeric(positions) || isempty(positions)
        error('ورودی باید یک ماتریس عددی باشد.');
    end
    
    % ایجاد یک figure برای تنظیم OuterPosition
    hFig = figure;

    % تنظیم OuterPosition برای هر سطر از ورودی
    for i = 1:size(positions, 1)
        set(hFig, 'OuterPosition', positions(i, :));
        pause(1); % توقف به مدت 1 ثانیه برای مشاهده تغییرات
    end
end

% تعریف مقادیر OuterPosition به صورت یک ماتریس
outerPositions = [
    100, 100, 400, 300; % [x, y, width, height]
    200, 200, 300, 200;
    300, 300, 250, 150
];

% فراخوانی تابع
setOuterPosition(outerPositions);