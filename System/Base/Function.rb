class Function
	def trigger_symbols
		[self.class.to_s.to_sym]
	end

	def wizzall list
		if list == nil
			return nil
		end

		wizzed_list = []

		list.each do |item|
			if item.is_a? Array
				wizzed_list << wizz(item)
			else
				wizzed_list << item
			end
		end

		wizzed_list
	end

	def run list
	end

    subclasses_are_in "Functions"

    def self.trigger_hash
    	unless @trigger_hash
    		@trigger_hash = {}
    		subclasses.each do |subclass|
    			function = subclass.new
    			function.trigger_symbols.each do |trigger|
    				@trigger_hash[trigger] = function
    			end    			
    		end 
    	end
    	return @trigger_hash
    end
end

# class Add < Function
# 	def trigger_symbols
# 		[]
# 	end

# 	def run list
# 	end	
# end
