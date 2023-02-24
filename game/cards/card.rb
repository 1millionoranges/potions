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
end