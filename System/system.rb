# Dir[File.dirname(__FILE__) + "/Functions/*.rb"].each do |file|
# 	puts file
# 	require file		
# end

# 

class Object
    def self.subclasses_are_in directory
        read_in_subclasses_from File.expand_path(SHIVA_ROOT) + '/System/' + directory
    end

    private

    def self.read_in_subclasses_from directory
        Dir.glob(directory + '/*.rb') do |file_name|
            require file_name
        end
    end
end

class Class
  def subclasses
    ObjectSpace.each_object(Class).select { |klass| klass < self }
  end
end

Dir.glob(File.join(".", "System", "Base", "*.rb")).each do |file|
   require file
end

puts "loaded functions: #{Function.subclasses}"