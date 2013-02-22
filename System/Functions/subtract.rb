class Subtract < Function
	def trigger_symbols
		[:-, :subtract]
	end

	def run list
		list = wizzall list

		if list.count == 2
			return list[0] - list[1]
		else
			return nil
		end
	end	
end
