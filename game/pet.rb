class Pet
    attr_reader :target
    def initialize(args={})
        @attack_delay = args[:attack_delay] || 30
        @attack_damage = args[:attack_damage] ||  3
        @health = args[:health] || 50
        @armor = args[:armor] || 0
        @pos = args[:pos] || Vector.new(0,0)
        @dimensions = args[:dimensions] || Vector.new(200,200)
        @actionable = true
        @actionable_time = 0
        @attack_point = 0

        @healthbar = Healthbar.new(max_health: @health)
        @target = nil
        @battle = nil
        @parent_asset = @battle
    end
    def set_target(target)
        @target = target
    end
    def remove_target(target)
        @target = nil
    end
    def set_battle(battle)
        @battle = battle
        @parent = @battle
    end
    def attack(time)
        @attack_damage
        @actionable_time = time + @attack_delay
        @attack_point = time + @attack_delay - 1
        @actionable = false
    end

    def tick(time)
        if !@dead
            if @actionable
                if @target
                    attack(time)
                else
                    stand
                end
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
            if @health <= 0
                die
            end
        end
    end

    def init_children(pos)
        @absolute_pos = pos + @pos
    end
    def take_damage(damage)
        @health -= (damage - @armor)
        @healthbar.set_health(@health)

    end
    def die
        @battle.remove_fighter(self)
        @actionable = false
        @healthbar.erase
        erase
        @dead = true
    end
    def erase
        @image.x = -2000
    end
    def stand
    end
    def draw_init
        @image = Circle.new(radius: 10, color: 'red')
    end
    def draw_frame
        yield(@image, @pos)
        @healthbar.draw_frame do |image, pos|
            yield(image, @pos + pos + Vector.new(0,30))
        end
        
    end
end