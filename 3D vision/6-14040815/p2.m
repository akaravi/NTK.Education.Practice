clc 
clear
close all
bw1 = imread('BrokenText.tif');

%% انواع مختلف strel (عناصر ساختاری)

% 1. دایره (Disk)
se_disk = strel('disk', 5);              % دایره با شعاع 5 - کاربرد: نرم‌سازی و حذف نویز
se_disk2 = strel('disk', 3, 4);          % دایره با شعاع 3 و 4 نقطه تقریبی - کاربرد: تقریب سریع‌تر برای پردازش سریع

% 2. مربع (Square)
se_square = strel('square', 5);           % مربع 5x5 - کاربرد: عملیات مورفولوژیکی با الگوی متقارن

% 3. مستطیل (Rectangle)
se_rect = strel('rectangle', [3 5]);      % مستطیل 3x5 - کاربرد: پردازش در جهت خاص (افقی یا عمودی)

% 4. خط (Line)
se_line = strel('line', 10, 45);          % خط به طول 10 و زاویه 45 درجه - کاربرد: تشخیص لبه‌های مورب
se_line2 = strel('line', 5, 0);           % خط افقی به طول 5 - کاربرد: تشخیص لبه‌های افقی
se_line3 = strel('line', 5, 90);          % خط عمودی به طول 5 - کاربرد: تشخیص لبه‌های عمودی

% 5. الماس (Diamond)
se_diamond = strel('diamond', 3);         % الماس با شعاع 3 - کاربرد: عملیات مورفولوژیکی با الگوی الماسی

% 6. اکتاگون (Octagon)
se_octagon = strel('octagon', 3);         % اکتاگون با شعاع 3 - کاربرد: تقریب دایره با دقت بیشتر

% 7. عنصر ساختاری دلخواه (Arbitrary)
se_arbitrary = strel([0 1 0; 1 1 1; 0 1 0]);  % شکل صلیبی - کاربرد: الگوهای سفارشی برای کاربردهای خاص

%% عملیات مورفولوژیکی با انواع مختلف strel

% استفاده از se_disk برای مثال
se = se_disk;

% 1. Dilation (اتساع) - بزرگ کردن اشیاء
bw_dilated = imdilate(bw1, se);           % کاربرد: پر کردن شکاف‌ها و اتصال اجزای جدا شده

% 2. Erosion (فرسایش) - کوچک کردن اشیاء
bw_eroded = imerode(bw1, se);             % کاربرد: حذف نویز و جدا کردن اشیاء متصل

% 3. Opening (باز کردن) - Erosion سپس Dilation
bw_opened = imopen(bw1, se);              % کاربرد: حذف نویز و حفظ ساختار کلی اشیاء

% 4. Closing (بستن) - Dilation سپس Erosion
bw_closed = imclose(bw1, se);             % کاربرد: پر کردن فضاهای خالی و اتصال اجزای نزدیک

% 5. Top-hat - تفاوت تصویر اصلی و Opening
bw_tophat = imtophat(bw1, se);            % کاربرد: استخراج اجزای کوچک روشن از پس‌زمینه تیره

% 6. Bottom-hat - تفاوت Closing و تصویر اصلی
bw_bothat = imbothat(bw1, se);            % کاربرد: استخراج اجزای کوچک تیره از پس‌زمینه روشن

% 7. Morphological Gradient - تفاوت Dilation و Erosion
bw_gradient = imdilate(bw1, se) - imerode(bw1, se);  % کاربرد: استخراج لبه‌ها و مرزهای اشیاء

%% نمایش نتایج

set(gcf,'units','normalized','outerposition',[0 0 1 1])

subplot(3,3,1), imshow(bw1), title('تصویر اصلی')
subplot(3,3,2), imshow(bw_dilated), title('Dilation (اتساع)')
subplot(3,3,3), imshow(bw_eroded), title('Erosion (فرسایش)')
subplot(3,3,4), imshow(bw_opened), title('Opening (باز کردن)')
subplot(3,3,5), imshow(bw_closed), title('Closing (بستن)')
subplot(3,3,6), imshow(bw_tophat), title('Top-hat')
subplot(3,3,7), imshow(bw_bothat), title('Bottom-hat')
subplot(3,3,8), imshow(bw_gradient), title('Morphological Gradient')

%% مثال‌های اضافی با انواع مختلف strel

figure;
subplot(2,4,1), imshow(bw1), title('اصلی')
subplot(2,4,2), imshow(imdilate(bw1, se_square)), title('Dilation با Square - الگوی متقارن')
subplot(2,4,3), imshow(imdilate(bw1, se_rect)), title('Dilation با Rectangle - جهت‌دار')
subplot(2,4,4), imshow(imdilate(bw1, se_line)), title('Dilation با Line - تشخیص خطوط')
subplot(2,4,5), imshow(imdilate(bw1, se_diamond)), title('Dilation با Diamond - الگوی الماسی')
subplot(2,4,6), imshow(imdilate(bw1, se_octagon)), title('Dilation با Octagon - تقریب دایره')
subplot(2,4,7), imshow(imdilate(bw1, se_arbitrary)), title('Dilation با Arbitrary - الگوی سفارشی')
subplot(2,4,8), imshow(imdilate(bw1, se_disk2)), title('Dilation با Disk (4 points) - سریع‌تر')