using List06ex;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace List06ex2
{
    public class MainClass6
    {
        public static void Main6()
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
            visitor.Visit(root);
            Console.WriteLine("Suma wartości na drzewie to {0}", visitor.Sum);
            Console.ReadLine();
        }
    }
    public abstract class Tree
    {
    }
    public class TreeNode : Tree
    {
        public Tree Left { get; set; }
        public Tree Right { get; set; }
    }
    public class TreeLeaf : Tree
    {
        public int Value { get; set; }
    }
    public abstract class TreeVisitor
    {
        // ta metoda nie jest potrzebna ale ułatwia korzystanie z Visitora
        public void Visit(Tree tree)
        {
            if (tree is TreeNode)
                this.VisitNode((TreeNode)tree);
            if (tree is TreeLeaf)
                this.VisitLeaf((TreeLeaf)tree);
        }
        public virtual void VisitNode(TreeNode node)
        {
            // tu wiedza o odwiedzaniu struktury
            if (node != null)
            {
                this.Visit(node.Left);
                this.Visit(node.Right);
            }
        }
        public virtual void VisitLeaf(TreeLeaf leaf)
        {
        }
    }
    public class SumTreeVisitor : TreeVisitor
    {
        public int Sum { get; set; }
        public override void VisitLeaf(TreeLeaf leaf)
        {
            // metoda z klasy bazowej musi być wywołana przy przeciążeniu
            // bo w klasie bazowej Visitora jest wiedza o odwiedzaniu
            // struktury kompozytu
            base.VisitLeaf(leaf);
            this.Sum += leaf.Value;
        }
    }
}