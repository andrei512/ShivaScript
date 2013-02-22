class Sin < Function
	def trigger_symbols
		[:sin]
	end

	def run list
		list = wizzall list
		if list.count == 1
			angle = list[0]
			return Math.sin(angle)
		else
			return nil
		end
	end	

end
