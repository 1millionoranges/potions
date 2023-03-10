class Battle
    def initialize(args={})
        @fighters = []
        @time = 0
        @pos = args[:pos] || Vector.new(0,0)
        @dimensions = args[:dimensions] || Vector.new(800,300)
        @screen = args[:screen] || nil
        draw_init
    end
    def add_fighter(fighter)
        fighter.set_battle(self)
        @fighters << fighter
    end
    def remove_fighter(fighter)
        @fighters.each do |f|
            if f.target == fighter
                f.remove_target(fighter)
            end
        end
        @fighters.delete(fighter)
    end
    def tick_fighters
        @fighters.each do |f|
            f.tick(@time)
        end
    end
    def tick
        tick_fighters
        @time+=1
    end
    def apply_damage(fighter, attack_damage)
        fighter.take_damage(attack_damage)
    end

    def init_children(pos)
        @absolute_pos = pos + @pos
        @fighters.each do |f|
            f.init_children(@absolute_pos)
        end    
    end
    def draw_init
        @background = Rectangle.new(width: @dimensions.x, height: @dimensions.y, color: 'white')
    end
    def draw_frame
        yield(@background, @pos)
        @fighters.each do |f|
            f.draw_frame do |image, position|
                yield(image, position + @pos)
            end
        end
    end
end