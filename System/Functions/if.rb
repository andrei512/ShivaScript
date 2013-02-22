class If < Function
	def trigger_symbols
		[:if]
	end

	def run list
		condition = list[0]
		consequent = list[1]
		alternative = list.count >= 3 ? list[2] : nil

		if wizz(condition)
			return wizz(consequent)
		elsif alternative != nil
			return wizz(alternative)
		else
			return nil
		end		 	 
	end	
end
