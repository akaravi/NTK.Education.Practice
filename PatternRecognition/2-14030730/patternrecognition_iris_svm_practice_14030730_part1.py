# -*- coding: utf-8 -*-
"""PatternRecognition-HeartSoundClassification-Practice-14030730-part1.ipynb

Automatically generated by Colab.

Original file is located at
    https://colab.research.google.com/drive/1gF8bbIo6f0BAyY4xOOzk7Ys3cNjymIxZ

در اینجا یک نمونه کد ساده برای استفاده از SVM\ (ماشین‌های بردار پشتیبان) با کتابخانه‌ی `scikit-learn` در پایتون آورده شده است. این کد شامل مراحل بارگذاری داده‌ها، آموزش مدل و پیش‌بینی نتایج می‌باشد.

مجموعه داده Iris یکی از معروف‌ترین و شناخته‌شده‌ترین مجموعه داده‌ها در زمینه یادگیری ماشین و آمار است. این مجموعه داده شامل اطلاعات مربوط به سه گونه مختلف گل Iris است که به شرح زیر می‌باشد:

### ویژگی‌ها (Attributes):
مجموعه داده Iris شامل ۴ ویژگی (ویژگی‌های عددی) است که برای هر گل اندازه‌گیری شده‌اند:

1. **طول سپال (Sepal Length)**: طول کاسبرگ گل به میلی‌متر.
2. **عرض سپال (Sepal Width)**: عرض کاسبرگ گل به میلی‌متر.
3. **طول گلبرگ (Petal Length)**: طول گلبرگ گل به میلی‌متر.
4. **عرض گلبرگ (Petal Width)**: عرض گلبرگ گل به میلی‌متر.

### کلاس‌ها (Classes):
مجموعه داده Iris شامل سه گونه مختلف از گل‌های Iris است که به شرح زیر می‌باشد:

1. **Iris Setosa**
2. **Iris Versicolor**
3. **Iris Virginica**

### تعداد نمونه‌ها:
مجموعه داده شامل ۱۵۰ نمونه است که به طور مساوی بین سه گونه گل تقسیم شده‌اند (هر گونه شامل ۵۰ نمونه).

### کاربردها:
مجموعه داده Iris به طور گسترده‌ای در زمینه‌های زیر مورد استفاده قرار می‌گیرد:

- **آموزش الگوریتم‌های یادگیری ماشین**: این مجموعه داده به عنوان یک مثال کلاسیک برای آموزش و آزمایش الگوریتم‌های طبقه‌بندی مانند SVM، درخت تصمیم، و k-نزدیک‌ترین همسایه (KNN) استفاده می‌شود.
- **تحلیل داده‌ها**: محققان و دانشجویان می‌توانند از این مجموعه داده برای تمرین و یادگیری تکنیک‌های مختلف تحلیل داده و تجزیه و تحلیل آماری استفاده کنند.

به طور کلی، مجموعه داده Iris یک منبع عالی برای یادگیری و آزمایش الگوریتم‌های یادگیری ماشین و تکنیک‌های تحلیل داده به شمار می‌آید.

در کد ارائه شده، از چندین کتابخانه مختلف استفاده شده است. در ادامه توضیح مختصری درباره هر یک از این کتابخانه‌ها و عملکرد آن‌ها ارائه می‌دهم:

1. **NumPy (`numpy`)**:
   - کتابخانه‌ای برای محاسبات عددی در پایتون است.
   - این کتابخانه به ویژه برای کار با آرایه‌های چند بعدی و انجام عملیات ریاضی و منطقی بر روی آن‌ها بسیار مفید است.
   - در این کد، برای کار با داده‌ها و انجام محاسبات استفاده می‌شود.

2. **Pandas (`pandas`)**:
   - کتابخانه‌ای برای تجزیه و تحلیل داده‌ها و مدیریت داده‌های جدولی است.
   - با استفاده از DataFrame، می‌توانید داده‌ها را به راحتی بارگذاری، پردازش و تجزیه و تحلیل کنید.
   - در این کد، از Pandas برای ایجاد DataFrame از مجموعه داده‌ی Iris و نمایش اطلاعات آن استفاده شده است.

3. **Matplotlib (`matplotlib.pyplot`)**:
   - کتابخانه‌ای برای رسم نمودارها و تجسم داده‌ها است.
   - این کتابخانه به شما اجازه می‌دهد تا نمودارهای مختلفی مانند خطی، پراکندگی، میله‌ای و غیره را رسم کنید.
   - در این کد، برای رسم نمودار پراکندگی داده‌های Iris استفاده شده است.

4. **Scikit-Learn (`sklearn`)**:
   - کتابخانه‌ای برای یادگیری ماشین در پایتون است که شامل الگوریتم‌های متنوعی برای یادگیری نظارت شده و بدون نظارت، ارزیابی مدل و پیش‌پردازش داده‌ها است.
   - در این کد، از ماژول‌های مختلف Scikit-Learn استفاده شده است:
     - `datasets`: برای بارگذاری مجموعه داده‌های از پیش تعریف شده (مانند Iris).
     - `model_selection`: برای تقسیم داده‌ها به مجموعه‌های آموزش و آزمون.
     - `svm`: برای استفاده از الگوریتم ماشین‌های بردار پشتیبان (SVM).
     - `metrics`: برای ارزیابی عملکرد مدل (مانند ماتریس سردرگمی و گزارش طبقه‌بندی).

با ترکیب این کتابخانه‌ها، می‌توانید به راحتی داده‌ها را بارگذاری، مدل‌های یادگیری ماشین را پیاده‌سازی و نتایج را تجزیه و تحلیل کنید.
"""

# وارد کردن کتابخانه‌های لازم
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.svm import SVC
from sklearn.metrics import classification_report, confusion_matrix

# بارگذاری مجموعه داده Iris
iris = datasets.load_iris()
X = iris.data
y = iris.target

# رسم داده‌ها
plt.scatter(X[:, 0], X[:, 1], c=y, cmap='viridis')
plt.xlabel('Feature 1')
plt.ylabel('Feature 2')
plt.title('Iris Dataset')
plt.show()

# ایجاد DataFrame از داده‌ها
iris_df = pd.DataFrame(data=X, columns=iris.feature_names)
iris_df['target'] = y

# نمایش ستون‌ها و نوع داده‌های آنها
print("DataFrame Info:")
print(iris_df.info())

# تقسیم داده‌ها به مجموعه آموزش و آزمون
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# ایجاد مدل SVM
model = SVC(kernel='linear')  # می‌توانید از kernel های دیگری نیز استفاده کنید

# آموزش مدل
model.fit(X_train, y_train)

# پیش‌بینی بر روی داده‌های آزمون
y_pred = model.predict(X_test)

# نمایش نتایج
print("Confusion Matrix:")
print(confusion_matrix(y_test, y_pred))
print("\nClassification Report:")
print(classification_report(y_test, y_pred))

"""### توضیحات:
- این کد از مجموعه داده‌ی Iris استفاده می‌کند که شامل سه نوع گل است.
- داده‌ها به دو بخش آموزش و آزمون تقسیم می‌شوند.
- مدل SVM با کرنل خطی ساخته و آموزش داده می‌شود.
- در نهایت، نتایج پیش‌بینی شامل ماتریس سردرگمی و گزارش طبقه‌بندی نمایش داده می‌شود.

"""