class Eq < Function
	def trigger_symbols
		[:==, :eq, :equals, :are_equal]
	end

	def run list
		list = wizzall list

		it = nil
		list.each do |item|
			if it == nil
				it = item
			elsif it != item
				return false
			end
		end
		return true
	end	
end
