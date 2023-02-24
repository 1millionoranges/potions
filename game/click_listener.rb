class ClickListener
    def initialize(pos, dimensions, funct)
        @pos = pos
        @dimensions = dimensions
        @funct = funct
        EventHandler.add_click_listener(self)
    end
    def check_click(event)
        bot_right = @pos + @dimensions

        left = @pos.x
        right = bot_right.x
        top = @pos.y
        bot = bot_right.y
        if event.x > left && event.x < right && event.y > top && event.y < bot
            execute
        end
    end
    def execute
        @funct.call
    end
end