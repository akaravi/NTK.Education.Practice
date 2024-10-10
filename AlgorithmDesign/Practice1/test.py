def insertion_sort(arr):
    print("Input :", arr)
    # شروع از دومین عنصر (index 1) تا انتهای آرایه
    for j in range(1, len(arr)):
        key = arr[j]  # کلید عنصر فعلی
        i = j - 1
        
        # جابجایی عناصر بزرگتر از کلید به یک مکان جلوتر
        while i >= 0 and arr[i] > key:
            arr[i + 1] = arr[i]  # جابجایی
            i -= 1
        
        arr[i + 1] = key  # قرار دادن کلید در مکان مناسب
        print("In Do:", arr)
# مثال استفاده
data = [12, 11, 13, 5, 6]
insertion_sort(data)
print("Sorted array is:", data)