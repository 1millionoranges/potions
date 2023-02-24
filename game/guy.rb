class Guy < Pet
    attr_accessor :attack_delay
    attr_accessor :attack_damage
    def initialize(args={})
        super(args)

        attack_frames = 8
        frame_time = (@attack_delay.to_f / attack_frames)
        @image = Sprite.new("../assets/guy_spritesheet.png",width:200, height: 200, clip_width: 200, clip_height: 200, time: frame_time,
        animations: {
            stand: 1..1,
            attack: 1..8

        })
  #      add_boost_listener
    end
    def attack(time)
        super(time)
        if @target.pos.x > @pos.x
            @image.play animation: :attack, loop: false
        else
            @image.play animation: :attack, loop: false, flip: :horizontal
        end
    end

    def stand

        @image.play animation: :stand, loop: true
    end
    def add_boost_listener
        @boost_lambda = lambda { |a| boost_speed }
        ClickListener.new(@absolute_pos, @dimensions, @boost_lambda)
    end
    def boost_speed
        Mouse.click_power(self)
    end
end