class Card
    def initialize(args={})
        @dimensions = args[:dimensions] || Vector.new(200,400)
        draw_init
    end
    def draw_init
        @image = Image.new('../assets/boost_card.png')
    end
    def draw_frame
        yield(@image, Vector.new(0,0))
    end

    def get_picked_up
        Mouse.pick_up(self)
    end
    def get_dropped
        Mouse.put_down(self)
    end
    
    def power(guy)
        guy.attack_delay /= 2
    end
end
