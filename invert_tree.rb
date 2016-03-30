class TreeNode
     attr_accessor :val, :left, :right
     def initialize(val)
         @val = val
         @left, @right = nil, nil
     end
end


def invert_tree(root)
   if root == nil
	   return nil
   end
   tmp = root.left
   root.left = root.right
   root.right = tmp
   invert_tree(root.left)
   invert_tree(root.right)
   return root
end
