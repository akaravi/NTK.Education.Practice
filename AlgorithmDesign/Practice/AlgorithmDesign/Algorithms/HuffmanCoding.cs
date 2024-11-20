using System;
using System.Collections.Generic;
using System.Linq;

public class Node
{
	public char Character;
	public int Frequency;
	public Node Left;
	public Node Right;

	public Node(char character, int frequency)
	{
		Character = character;
		Frequency = frequency;
		Left = null;
		Right = null;
	}
}

class HuffmanCoding
{
	public static void run()
	{


		string input = "this is an example for huffman encoding";
		Console.WriteLine("input:" + input);
		var frequencyTable = BuildFrequencyTable(input);
		var root = BuildHuffmanTree(frequencyTable);
		var huffmanCodes = new Dictionary<char, string>();
		GenerateHuffmanCodes(root, "", huffmanCodes);

		Console.WriteLine("Huffman Codes:");
		foreach (var pair in huffmanCodes)
		{
			Console.WriteLine($"{pair.Key}: {pair.Value}");
		}

		// کدگذاری متن ورودی
		string encodedValue = Encode(input, huffmanCodes);
		Console.WriteLine($"\nEncoded Value: {encodedValue}");

		// معکوس کردن دیکشنری کدهای هافمن
		var reversedHuffmanCodes = ReverseHuffmanCodes(huffmanCodes);

		// دیکد کردن
		string decodedValue = Decode(encodedValue, reversedHuffmanCodes);
		Console.WriteLine($"\nDecoded Value: {decodedValue}");
	}

	// مرحله 1: ساخت جدول فرکانس
		public static Dictionary<char, int> BuildFrequencyTable(string input)
	{
		var frequencyTable = new Dictionary<char, int>();
		foreach (char c in input)
		{
			if (frequencyTable.ContainsKey(c))
				frequencyTable[c]++;
			else
				frequencyTable[c] = 1;
		}
		return frequencyTable;
	}

	// مرحله 2: ساخت درخت هافمن
	public static Node BuildHuffmanTree(Dictionary<char, int> frequencyTable)
	{
		var priorityQueue = new List<Node>();

		// ایجاد نودهای اولیه
		foreach (var pair in frequencyTable)
		{
			priorityQueue.Add(new Node(pair.Key, pair.Value));
		}

		// ساخت درخت هافمن
		while (priorityQueue.Count > 1)
		{
			// مرتب‌سازی بر اساس فرکانس
			priorityQueue = priorityQueue.OrderBy(n => n.Frequency).ToList();
			var left = priorityQueue[0];
			var right = priorityQueue[1];

			// ایجاد نود جدید با فرکانس جمع شده
			var newNode = new Node('\0', left.Frequency + right.Frequency)
			{
				Left = left,
				Right = right
			};

			// حذف نودهای قدیمی و اضافه کردن نود جدید
			priorityQueue.Remove(left);
			priorityQueue.Remove(right);
			priorityQueue.Add(newNode);
		}

		return priorityQueue[0]; // ریشه درخت
	}

	// مرحله 3: تولید کدهای هافمن
	public static void GenerateHuffmanCodes(Node node, string code, Dictionary<char, string> huffmanCodes)
	{
		if (node == null)
			return;

		// اگر نود یک حرف است، کد مربوطه را ذخیره کنید
		if (node.Left == null && node.Right == null)
		{
			huffmanCodes[node.Character] = code;
		}

		// ادامه به نودهای چپ و راست
		GenerateHuffmanCodes(node.Left, code + "0", huffmanCodes);
		GenerateHuffmanCodes(node.Right, code + "1", huffmanCodes);
	}

	// مرحله 4: کدگذاری متن ورودی
	public static string Encode(string input, Dictionary<char, string> huffmanCodes)
	{
		string encodedValue = "";
		foreach (char c in input)
		{
			encodedValue += huffmanCodes[c];
		}
		return encodedValue;
	}

	// مرحله 5: دیکد کردن کدگذاری شده
	public static string Decode(string encodedValue, Dictionary<string, char> huffmanCodes)
	{
		string decodedValue = "";
		string tempCode = "";

		foreach (char bit in encodedValue)
		{
			tempCode += bit; // افزودن بیت به کد موقت

			// بررسی اینکه آیا کد موقت در دیکشنری وجود دارد
			if (huffmanCodes.ContainsKey(tempCode))
			{
				decodedValue += huffmanCodes[tempCode]; // افزودن کاراکتر مربوطه به متن دیکد شده
				tempCode = ""; // بازنشانی کد موقت
			}
		}

		return decodedValue;
	}

	// مرحله 6: معکوس کردن دیکشنری کدهای هافمن
	public static Dictionary<string, char> ReverseHuffmanCodes(Dictionary<char, string> huffmanCodes)
	{
		var reversed = new Dictionary<string, char>();
		foreach (var pair in huffmanCodes)
		{
			reversed[pair.Value] = pair.Key;
		}
		return reversed;
	}
}