using System;
using System.Collections.Generic;

Console.OutputEncoding = System.Text.Encoding.Unicode;




// وزن‌ها و ارزش‌های اقلام
int[] weights = { 5, 15, 9, 10, 30 };
int[] values = { 30, 60, 27, 20, 30 };
int capacity = 21;

// حل مسئله و دریافت خروجی
var result = KnapsackProblem.Knapsack(weights, values, capacity);
Console.WriteLine($"حداکثر ارزش قابل حمل: {result.maxValue}");
Console.WriteLine("کالاهای انتخاب شده:");
foreach (var item in result.selectedItems)
{
	Console.WriteLine($"کالا با ایندکس: {item}");
}



string input = "this is an example for huffman encoding";
Console.WriteLine("input:" + input);
var frequencyTable = HuffmanCoding.BuildFrequencyTable(input);
var root = HuffmanCoding.BuildHuffmanTree(frequencyTable);
var huffmanCodes = new Dictionary<char, string>();
HuffmanCoding.GenerateHuffmanCodes(root, "", huffmanCodes);

Console.WriteLine("Huffman Codes:");
foreach (var pair in huffmanCodes)
{
	Console.WriteLine($"{pair.Key}: {pair.Value}");
}

// کدگذاری متن ورودی
string encodedValue = HuffmanCoding.Encode(input, huffmanCodes);
Console.WriteLine($"\nEncoded Value: {encodedValue}");

// معکوس کردن دیکشنری کدهای هافمن
var reversedHuffmanCodes = HuffmanCoding.ReverseHuffmanCodes(huffmanCodes);

// دیکد کردن
string decodedValue = HuffmanCoding.Decode(encodedValue, reversedHuffmanCodes);
Console.WriteLine($"\nDecoded Value: {decodedValue}");
