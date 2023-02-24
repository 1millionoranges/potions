class Mouse
    @@holding_guy = nil
    def self.pick_up(guy)
        if !@@holding_guy
            @@holding_guy = guy 
            p Window.mouse_x
        end
    end
    def self.put_down
        if @@holding_guy
        end
        @@holding_guy = nil
    end
    def self.draw_frame
        @pos = Vector.new(Window.mouse_x, Window.mouse_y)
        if @@holding_guy
            @@holding_guy.draw_frame do |image, pos|
                image.x = (pos + @pos).x
                image.y = (pos + @pos).y
            end
        end
    end

    def self.click_power(g)
        if @@holding_guy
            @@holding_guy.power(g)
            Mouse.put_down
        end
    end
end