class Pet

    def initialize(args={})
        @attack_delay = args[:attack_delay] || 120
        @attack_damage = args[:attack_damage] ||  3
        @health = args[:health] || 50
        @armor = args[:armor] || 0
        @pos = args[:pos] || Vector.new(0,0)
        @actionable = true
        @actionable_time = 0
        @attack_point = 0

        @target = nil
        @battle = nil
    end
    def set_target(target)
        @target = target
    end
    def set_battle(battle)
        @battle = battle
    end
    def attack(time)
        p "attacking"
        @attack_damage
        @actionable_time = time + @attack_delay
        @attack_point = time + @attack_delay - 1
        @actionable = false
    end

    def tick(time)
        if @actionable
            attack(time)
        else
            if @attack_point != 0 && time > @attack_point
                if @target
                    @battle.apply_damage(@target, @attack_damage)
                end
            end    
            if time > @actionable_time
                @actionable = true
            end
        end
    end
    def take_damage(damage)
        @health -= (damage - @armor)
        if @health <= 0
            die
        end
        p @health
    end
    def die
        @battle.remove_fighter(self)
    end
    def draw_init
        @image = Circle.new(radius: 10, color: 'red')
    end
    def draw_frame
        yield(@image, @pos)
    end
end