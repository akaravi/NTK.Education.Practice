using System;
using System.Collections.Generic;

public class KnapsackProblem
{
	public static void run()
	{

		// وزن‌ها و ارزش‌های اقلام
		int[] weights = { 5, 15, 9, 10, 30 };
		int[] values = { 30, 60, 27, 20, 30 };
		int capacity = 21;

		// حل مسئله و دریافت خروجی
		var result = Knapsack(weights, values, capacity);
		Console.WriteLine($"حداکثر ارزش قابل حمل: {result.maxValue}");
		Console.WriteLine("کالاهای انتخاب شده:");
		foreach (var item in result.selectedItems)
		{
			Console.WriteLine($"کالا با ایندکس: {item}");
		}

	}
	// تابعی برای حل مسئله کوله‌پشتی
	public static (int maxValue, List<int> selectedItems) Knapsack(int[] weights, int[] values, int capacity)
    {
        int n = values.Length;
        // ایجاد یک جدول برای ذخیره‌سازی حداکثر ارزش‌ها
        int[,] K = new int[n + 1, capacity + 1];

        // پر کردن جدول K
        for (int i = 1; i <= n; i++)
        {
            for (int w = 1; w <= capacity; w++)
            {
                // اگر وزن کالا کمتر یا برابر با ظرفیت کوله‌پشتی باشد
                if (weights[i - 1] <= w)
                {
                    // حداکثر بین انتخاب و عدم انتخاب کالا
                    K[i, w] = Math.Max(K[i - 1, w], K[i - 1, w - weights[i - 1]] + values[i - 1]);
                }
                else
                {
                    // اگر کالا انتخاب نشود
                    K[i, w] = K[i - 1, w];
                }
            }
        }

        // پیدا کردن اقلام انتخاب شده
        List<int> selectedItems = new List<int>();
        int remainingCapacity = capacity;

        for (int i = n; i > 0; i--)
        {
            // اگر ارزش در جدول تغییر کرده باشد، یعنی کالا انتخاب شده است
            if (K[i, remainingCapacity] != K[i - 1, remainingCapacity])
            {
                selectedItems.Add(i - 1); // اضافه کردن ایندکس کالا به لیست
                remainingCapacity -= weights[i - 1]; // کاهش ظرفیت با وزن کالای انتخاب شده
            }
        }

        // بازگشت حداکثر ارزش و اقلام انتخاب شده
        return (K[n, capacity], selectedItems);
    }

}