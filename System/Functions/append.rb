class Append < Function
	def trigger_symbols
		[:append]
	end

	def run list
		list = wizzall list
		
		result = []
		list.each do |sublist|
			result = result + sublist
		end
		return result
	end	
end
