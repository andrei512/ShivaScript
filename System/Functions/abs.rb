class Abs < Function
	def trigger_symbols
		[:abs]
	end

	def run list
		list = wizzall list
		return list[0].abs
	end	
end
