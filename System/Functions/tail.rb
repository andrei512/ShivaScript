class Tail < Function
	def trigger_symbols
		[:tail]
	end

	def run list
		list = wizzall list
		if list.is_a? Array and list.head.is_a? Array
			return list.head.tail
		else
			return nil
		end
	end	
end
