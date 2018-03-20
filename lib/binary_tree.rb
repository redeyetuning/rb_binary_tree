class Node
	@@nodes = 0
	
	def self.nodes
		@@nodes
	end

	attr_accessor :value, :left, :right

	def initialize value, parent=nil
		@@nodes += 1
		@value = value
		@parent = parent
		@left = nil
		@right = nil
	end

end

class BinaryTree

	attr_accessor :root

	# Helper function used to insert a value to a nodes left or right (less or more) 
	def insert node, value= nil
			if value < node.value
				node.left.nil? ? node.left = Node.new(value, node) : insert(node.left, value)
			elsif value >= node.value
				node.right.nil? ? node.right = Node.new(value, node) : insert(node.right, value)
			end		
	end

	# Creates a binary tree from an input array of variables using the helper function 'insert'.
	def build_tree array
		@root = Node.new array[0]
		@nodes += 1
		array[1..-1].each do |var|
			insert(@root,var)
		end
	end

	# Runs a breadth first search for value using an array acting as a queue.
	def breadth_first_search node= self.root, value
		queue = [node]
		while queue.length > 0
			current = queue.pop
			return "Value #{value} found in #{current.to_s}" if current.value == value
			queue.unshift(current.left) if current.left
			queue.unshift(current.right) if current.right
		end

	end

	# Runs a depth first search for value an array acting as a stack.
	def depth_first_search node= self.root, value
		stack =[node]

		while stack.length > 0
			current = stack.pop
			return "Value #{value} found in #{current.to_s}" if current.value == value
			stack.push(current.left) if current.left
			stack.push(current.right) if current.right
		end
	end

	# Runs a depth first search for value using recursion.
	def dfs_rec node= self.root, value
		if node.value == value
			return "Value #{value} found in #{node.to_s}"
		else
			 dfs_rec(node.left, value) if node.left
			 dfs_rec(node.right, value) if node.right
		end
	end
	
end
