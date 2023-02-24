class DamageCard < Card
    def draw_init
        @image = Image.new('../assets/damage_card.png')
    end
    def power(g)
        g.attack_damage += 10
    end
end