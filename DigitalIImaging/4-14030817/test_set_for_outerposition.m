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
        % دریافت موقعیت فعلی OuterPosition
        currentPosition = get(gcf, 'OuterPosition');

        % نمایش موقعیت فعلی
        disp('موقعیت فعلی OuterPosition:');
        disp(currentPosition);

        pause(1); % توقف به مدت 1 ثانیه برای مشاهده تغییرات
    end
    disp(' حالا فقط عرض  را تغییر می دهیم');
    for i = 1:5
        % افزایش عرض
        newWidth = currentPosition(3) + 100; % به عرض فعلی 100 واحد اضافه می‌کنیم
        currentPosition(3) = newWidth;
        
        % به‌روزرسانی OuterPosition
        set(gcf, 'OuterPosition', currentPosition);
        
        % نمایش موقعیت فعلی
        disp('موقعیت فعلی OuterPosition:');
        disp(currentPosition);

        pause(1); % توقف به مدت 1 ثانیه برای مشاهده تغییرات
    end
    disp(' حالا فقط طول را تغییر می دهیم');
    for i = 1:5
        % افزایش عرض
        newHigth = currentPosition(4) + 100; % به عرض فعلی 100 واحد اضافه می‌کنیم
        currentPosition(4) = newHigth;

        % به‌روزرسانی OuterPosition
        set(gcf, 'OuterPosition', currentPosition);
        
        % نمایش موقعیت فعلی
        disp('موقعیت فعلی OuterPosition:');
        disp(currentPosition);

        pause(1); % توقف به مدت 1 ثانیه برای مشاهده تغییرات
    end
end

% تعریف مقادیر OuterPosition به صورت یک ماتریس
outerPositions = [
    100, 100, 400, 300; % [x, y, width, height]
    200, 200, 300, 200;
    300, 300, 250, 150;
    100, 100, 400, 300;
    150, 150, 400, 300;
    200, 200, 400, 300;
    250, 250, 400, 300;
];

% فراخوانی تابع
setOuterPosition(outerPositions);