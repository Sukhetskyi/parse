class Item
    attr_accessor :id, :name, :price, :description

    def initialize(id = 0, name ='', price = 0, description = '')
        @id = id
        @name = name
        @price = price
        @description = description
    end

    def to_s()
        "id=#@id, name=#@name, price=#@price, description=#@description"
    end

    def to_h()
        {'id' => @id, 'name'=> @name, 'price' => @price, 'description' => @description}
    end

    def info()
        yield
    end

end
