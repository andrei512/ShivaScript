class Max < Function
	def trigger_symbols
		[:max, :maximum_of]
	end

	def run list
		list = wizzall list

		if list.count == 1 and list.head.is_a? Array 
			list = list.head
		end

		if list.count > 0
			max = list.head
			list.each do |item|
				if item > max 
					max = item
				end
			end
			return max
		else
			return nil
		end
	end	
end
