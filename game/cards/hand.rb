class Hand
    def initialize(args={})
        @pos = args[:pos] || Vector.new(0,0)
        @dimensions = args[:dimensions] || Vector.new(800,400)
        @cards = []
        @max_card_number = 5
        draw_init

        clicked_event = lambda { |event| get_clicked(event) }
        ClickListener.new(@pos, @dimensions, clicked_event)
    end

    def add_card(card)
        if @cards.size >= @max_card_number
            return false
        else
            @cards << card
        end
        return true
    end
    def get_clicked(event)

        if Mouse.pick_up(@cards[0])
            @cards.shift
        end
        p "hand clicked"
    end
    def draw_init
        @background_rectangle = Rectangle.new(width: @dimensions.x, height: @dimensions.y, color: 'white')
    end
    def draw_frame
        card_spacing = @dimensions.x / (@cards.size)
        i = 0
        yield(@background_rectangle, @pos)
        @cards.each do |c|
            c.draw_frame do |image, pos|
                yield(image, pos + @pos + Vector.new(i * card_spacing, 0))
            end
            i+=1
        end
    end
end