class Collection
    def initialize(*elements)
        @data = elements
    end
    
    def swap(i, j)
        @data[i], @data[j] = @data[j], @data[i]
    end
    
    def length
        @data.length
    end
    
    def get(i)
        @data[i]
    end

    def print_all
        puts @data.to_s
    end
end