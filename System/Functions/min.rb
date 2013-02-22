class Min < Function
	def trigger_symbols
		[:min, :minimum_of]
	end

	def run list
		list = wizzall list

		if list.count == 1 and list.head.is_a? Array 
			list = list.head
		end

		if list.count > 0
			min = list.head
			list.each do |item|
				if item < min 
					min = item
				end
			end
			return min
		else
			return nil
		end
	end	
end
