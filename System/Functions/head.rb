class Head < Function
	def trigger_symbols
		[:head]
	end

	def run list
		list = wizzall list
		if list.is_a? Array and list.head.is_a? Array
			return list.head.head
		else
			return nil
		end
	end	
end
