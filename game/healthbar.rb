class Healthbar
    def initialize(args={})
        
        @max_health = args[:max_health] || 0
        @current_health = args[:current_health] || @max_health
        @width = args[:width] || 200
        draw_init
        @back_rec_pos = Vector.new(-(@max_health / 2), -15)
        @front_rec_pos = @back_rec_pos + Vector.new(5,5)
    end
    def draw_init
        @back_rectangle = Rectangle.new(width: @width + 10, height: 30, color: 'black')
        @health_rectangle = Rectangle.new(width: @width, height: 20, color: 'green')
    end

    def draw_frame
        yield(@back_rectangle, @back_rec_pos)

        yield(@health_rectangle, @front_rec_pos)
    end
    def resize_bar
        health_ratio = @current_health.to_f / @max_health
        @health_rectangle.width = (@width * health_ratio).to_i
    end
    def set_health(h)
        @current_health = h
        resize_bar
    end
    def erase
        @back_rectangle.x = -1000
        @health_rectangle.x = -1000
    end
end
