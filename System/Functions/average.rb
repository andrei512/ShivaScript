class Average < Function
	def trigger_symbols
		[:avg, :average]
	end

	def run list
		list = wizzall list

		if list.count == 0
			return nil
		end

		if list.count == 1 and list.head.is_a? Array 
			list = list.head
		end

		sum = 0
		list.each do |item|
			sum += item
		end
		return sum / list.count
	end	
end
