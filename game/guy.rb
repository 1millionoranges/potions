class Guy < Pet
    def initialize(args={})
        super(args)
        @image = Sprite.new("../assets/guy_spritesheet.png",clip_width: 200, time: 40,
        animations: {
            stand: 1,
            attack: 1..8

        })
        add_boost_listener
    end
    def attack(time)
        super(time)
        @image.play animation: :attack, loop: false
    end

    def add_boost_listener
        @boost_lambda = lambda { boost_speed }
        ClickListener.new(@pos, @dimensions, @boost_lambda)
    end
    
    def boost_speed
        @attack_delay /= 2
    end
end