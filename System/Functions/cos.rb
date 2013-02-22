class Cos < Function
	def trigger_symbols
		[:cos]
	end

	def run list
		list = wizzall list
		if list.count == 1
			angle = list[0]
			return Math.cos(angle)
		else
			return nil
		end
	end	

end
