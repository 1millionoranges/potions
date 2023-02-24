class Guy < Pet
    def initialize(args={})
        super(args)

        attack_frames = 8
        frame_time = (@attack_delay.to_f / attack_frames)
        @image = Sprite.new("../assets/guy_spritesheet.png",clip_width: 200, time: frame_time,
        animations: {
            stand: 1..1,
            attack: 1..8

        })
  #      add_boost_listener
    end
    def attack(time)
        super(time)
        @image.play animation: :attack, loop: false
    end

    def stand

        @image.play animation: :stand, loop: true
    end
    def add_boost_listener
        @boost_lambda = lambda { boost_speed }
        ClickListener.new(@absolute_pos, @dimensions, @boost_lambda)
    end
    def boost_speed
        @attack_delay /= 2
    end
end