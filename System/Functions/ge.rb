class Ge < Function
	def trigger_symbols
		[:>=, :ge]
	end

	def run list
		list = wizzall list

		if list.count == 2
			return list[0] >= list[1]
		else
			return nil
		end		
	end	
end
