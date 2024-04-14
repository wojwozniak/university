using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List06
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

            DepthTreeVisitor depthVisitor = new DepthTreeVisitor();
            root.Accept(depthVisitor);

            Console.WriteLine("Głębość {0}", depthVisitor.MaxDepth);
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
        public abstract void VisitDepth(int depth); // Metoda pod głębokość
    }

    // Implementacja tutah
    public class DepthTreeVisitor : TreeVisitor
    {
        public int MaxDepth { get; set; }
        private int currentDepth;

        public DepthTreeVisitor()
        {
            MaxDepth = 0;
            currentDepth = 0;
        }

        public override void VisitNode(TreeNode node)
        {
            currentDepth++;
            VisitDepth(currentDepth);
        }

        public override void VisitLeaf(TreeLeaf leaf)
        {
            VisitDepth(currentDepth);
        }

        public override void VisitDepth(int depth)
        {
            if (depth > MaxDepth)
                MaxDepth = depth;
        }
    }
}