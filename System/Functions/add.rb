class Add < Function
	def trigger_symbols
		[:+, :add]
	end

	def run list
		list = wizzall list

		sum = 0
		list.each do |item|
			sum += item
		end
		return sum
	end	
end
