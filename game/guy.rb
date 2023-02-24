class Guy < Pet
    def initialize(args={})
        super(args)
        @image = Sprite.new("../assets/guy_spritesheet.png",clip_width: 200, time: 200,
        animations: {
            stand: 1,
            attack: 1..8
        })

    end
    def attack(time)
        super(time)
        @image.play animation: :attack, loop: false
    end

end