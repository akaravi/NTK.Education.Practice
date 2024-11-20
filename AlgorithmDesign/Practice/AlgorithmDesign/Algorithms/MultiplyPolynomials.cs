using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlgorithmDesign.Algorithms
{
	/// <summary>
	/// ضرب دوجمله ای
	/// </summary>
	internal class MultiplyPolynomials
	{
	public	static void run()
		{
			// ورودی چندجمله‌ای اول
			Console.Write("تعداد ضرایب چندجمله‌ای اول را وارد کنید: ");
			int n1 = int.Parse(Console.ReadLine());
			double[] poly1 = new double[n1];

			Console.WriteLine("ضرایب چندجمله‌ای اول را وارد کنید (از جمله با بیشترین درجه به جمله با کمترین درجه):");
			for (int i = 0; i < n1; i++)
			{
				poly1[i] = double.Parse(Console.ReadLine());
			}

			// ورودی چندجمله‌ای دوم
			Console.Write("تعداد ضرایب چندجمله‌ای دوم را وارد کنید: ");
			int n2 = int.Parse(Console.ReadLine());
			double[] poly2 = new double[n2];

			Console.WriteLine("ضرایب چندجمله‌ای دوم را وارد کنید (از جمله با بیشترین درجه به جمله با کمترین درجه):");
			for (int i = 0; i < n2; i++)
			{
				poly2[i] = double.Parse(Console.ReadLine());
			}

			// ضرب دو چندجمله‌ای
			double[] result = bin(poly1, poly2);

			// نمایش نتیجه
			Console.WriteLine("حاصل‌ضرب دو چندجمله‌ای:");
			for (int i = 0; i < result.Length; i++)
			{
				Console.Write(result[i] + (i < result.Length - 1 ? "x^" + (result.Length - 1 - i) + " + " : ""));
			}
		}

		static double[] bin(double[] poly1, double[] poly2)
		{
			int resultDegree = poly1.Length + poly2.Length - 1;
			double[] result = new double[resultDegree];

			for (int i = 0; i < poly1.Length; i++)
			{
				for (int j = 0; j < poly2.Length; j++)
				{
					result[i + j] += poly1[i] * poly2[j];
				}
			}

			return result;
		}
	}
}
