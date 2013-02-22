class Atom < Function
	def trigger_symbols
		[:atom, :is_atom?]
	end

	def run list
		list = wizzall list
		if list.count == 1
			return list[0].count <= 1
		end
		return false
	end	
end
