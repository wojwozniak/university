using List06;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List06ex
{
    public class MainClass
    {
        public static void Main()
        {
            Tree root = new TreeNode()
            {
                Left = new TreeNode()
                {
                    Left = new TreeLeaf() { Value = 1 },
                    Right = new TreeLeaf() { Value = 2 },
                },
                Right = new TreeLeaf() { Value = 3 }
            };
            SumTreeVisitor visitor = new SumTreeVisitor();
            root.Accept(visitor);
            Console.WriteLine("Suma wartości na drzewie to {0}", visitor.Sum);
            Console.ReadLine();
        }
    }
    public abstract class Tree
    {
        public virtual void Accept(TreeVisitor visitor)
        {
        }
    }
    public class TreeNode : Tree
    {
        public Tree Left { get; set; }
        public Tree Right { get; set; }
        public override void Accept(TreeVisitor visitor)
        {
            visitor.VisitNode(this);
            if (Left != null)
                Left.Accept(visitor);
            if (Right != null)
                Right.Accept(visitor);
        }
    }
    public class TreeLeaf : Tree
    {
        public int Value { get; set; }
        public override void Accept(TreeVisitor visitor)
        {
            visitor.VisitLeaf(this);
        }
    }
    public abstract class TreeVisitor
    {
        public abstract void VisitNode(TreeNode node);
        public abstract void VisitLeaf(TreeLeaf leaf);
    }
    public class SumTreeVisitor : TreeVisitor
    {
        public int Sum { get; set; }
        public override void VisitNode(TreeNode node)
        {

        }
        public override void VisitLeaf(TreeLeaf leaf)
        {
            this.Sum += leaf.Value;
        }
    }
}