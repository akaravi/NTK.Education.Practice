using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlgorithmDesign.Algorithms
{
	internal class Fibonacci
	{
		public static void run()
		{
			Console.Write("لطفاً شماره جمله فیبوناچی را وارد کنید: ");
			int n = int.Parse(Console.ReadLine());

			if (n < 0)
			{
				Console.WriteLine("لطفاً یک عدد غیر منفی وارد کنید.");
			}
			else
			{
				long result = Fib(n);
				Console.WriteLine($"جمله {n} ام دنباله فیبوناچی: {result}");
			}
		}
		public static long Fib(int n)
		{
			if (n == 0) return 0;
			if (n == 1) return 1;

			long a = 0, b = 1, c = 0;

			for (int i = 2; i <= n; i++)
			{
				c = a + b;
				a = b;
				b = c;
			}

			return c;
		}
	}
}
