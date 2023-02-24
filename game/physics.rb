class Vector
    attr_accessor :x
    attr_accessor :y
    def initialize(x, y)
        @x = x
        @y = y
    end
    def +(vector2)
        x = @x + vector2.x
        y = @y + vector2.y
        Vector.new(x,y)
    end
    def add!(vector2)
        @x += vector2.x
        @y += vector2.y
    end
    def -(vector2)
        x = @x - vector2.x
        y = @y - vector2.y
        Vector.new(x,y)
    end
    def /(scalar)
        Vector.new(@x / scalar, @y / scalar)
    end
    def *(scalar)
        Vector.new(@x * scalar, @y * scalar)
    end
    def minus!(vector2)
        @x -= vector2.x
        @y -= vector2.y
    end
    def magnitude
        Math.sqrt(@x**2 + @y**2)
    end
    def normalize
        mag = magnitude
        Vector.new(@x / mag, @y / mag)
    end
    def distance_to(vector2)
        (self - vector2).magnitude
    end
    def clone
        Vector.new(@x, @y)
    end
    def get_angle
        if @x != 0
            
            ans = Math.atan(@y / @x)
            if @x < 0
                ans -= (Math::PI)
            end
        else
            return 0
        end
        return ans
    end
end