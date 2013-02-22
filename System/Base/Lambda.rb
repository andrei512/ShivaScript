class Lambda
	attr_accessor :param_symbols
	attr_accessor :translation 

	def list_with blueprint, symbols
		translated_list = blueprint.collect do |item|
			if item.is_a? Symbol
				if symbols[item]
					symbols[item]
				else
					item
				end
			elsif item.is_a? Array 
				list_with item, symbols
			else
				item
			end
		end
		return translated_list
	end

	def wizz list
		params = list[param_symbols.count..list.count]

		symbol_hash = {}
		Array(0..param_symbols.count-1).each do |i|
			symbol_hash[param_symbols[i]] = list[i]
		end

		symbol_hash[:params] = params

		translated_list = list_with self.translation, symbol_hash

		return translated_list
	end

	def self.lambda_with_params_and_translation params, translation
		lambda = Lambda.new

		lambda.param_symbols = params
		lambda.translation = translation

		return lambda
	end	
end