using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AlgorithmDesign.Algorithms
{

	class Node
	{
		public int Key; // کلید منحصر به فرد
		public int Value; // مقدار مرتبط با کلید
		public Node Left;
		public Node Right;

		public Node(int key, int value)
		{
			Key = key;
			Value = value;
			Left = null;
			Right = null;
		}
	}

	internal static class BSTAlgorithm
	{
	public	static void run()
		{
			BST bst = new BST();

			// درج مقادیر در درخت
			bst.Insert(50, 100);
			bst.Insert(30, 60);
			bst.Insert(20, 30);
			bst.Insert(40, 80);
			bst.Insert(70, 90);
			bst.Insert(60, 70);
			bst.Insert(80, 110);

			// نمایش درخت به صورت مرتب
			Console.WriteLine("Traversal of BST in In-Order:");
			bst.InOrderTraversal();

			// جستجوی مقادیر در درخت
			Console.Write("کلید مورد نظر برای جستجو را وارد کنید: ");
			int targetKey = int.Parse(Console.ReadLine());

			if (bst.Search(targetKey, out int value))
			{
				Console.WriteLine($"کلید {targetKey} با مقدار {value} در درخت پیدا شد.");
			}
			else
			{
				Console.WriteLine($"کلید {targetKey} در درخت پیدا نشد.");
			}
		}
	}

	internal class BST
	{

		private Node root;

		public void Insert(int key, int value)
		{
			root = InsertRec(root, key, value);
		}

		private Node InsertRec(Node root, int key, int value)
		{
			if (root == null)
			{
				root = new Node(key, value);
				return root;
			}

			if (key < root.Key)
			{
				root.Left = InsertRec(root.Left, key, value);
			}
			else if (key > root.Key)
			{
				root.Right = InsertRec(root.Right, key, value);
			}

			// اگر کلید برابر باشد، می‌توانید تصمیم بگیرید که چه کاری انجام دهید
			// در اینجا ما فرض می‌کنیم که کلیدهای تکراری مجاز نیستند
			return root;
		}

		public bool Search(int key, out int value)
		{
			return SearchRec(root, key, out value);
		}

		private bool SearchRec(Node root, int key, out int value)
		{
			if (root == null)
			{
				value = default;
				return false;
			}

			if (key == root.Key)
			{
				value = root.Value;
				return true;
			}

			return key < root.Key ? SearchRec(root.Left, key, out value) : SearchRec(root.Right, key, out value);
		}

		public void InOrderTraversal()
		{
			InOrderRec(root);
		}

		private void InOrderRec(Node root)
		{
			if (root != null)
			{
				InOrderRec(root.Left);
				Console.WriteLine($"Key: {root.Key}, Value: {root.Value}");
				InOrderRec(root.Right);
			}
		}
	}
}