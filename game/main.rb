require 'ruby2d'
require './pet.rb'
require './guy.rb'
require './screen.rb'
require './physics.rb'
require './battle.rb'
require './event_handler.rb'
require './click_listener.rb'
require './healthbar.rb'
require './cards/hand.rb'
require './cards/card.rb'
require './mouse.rb'
require './cards/damagecard.rb'
keys_pressed = []
on :key_down do |event|
    keys_pressed << event.key
    if event.key == "escape"
        close
    end
end

on :mouse_down do |event|
    EventHandler.click_event(event)
end

Screen.set_params(height: 1000, width: 1800)
set title: Screen.name
set height: 1000
set width: 1800
b = Battle.new(pos: Vector.new(200,200))

Screen.add_asset(b)
g1 = Guy.new(pos: Vector.new(20, 10), armor: 2)
g2 = Guy.new(pos: Vector.new(200,0), armor: 3)
g1.set_target(g2)
g2.set_target(g1)
b.add_fighter(g1)
b.add_fighter(g2)
Screen.init_children
g1.add_boost_listener
g2.add_boost_listener

h = Hand.new(pos: Vector.new(30,500))
c = Card.new()
c2 = Card.new
c3 = DamageCard.new
c4 = Card.new
h.add_card(c3)
h.add_card(c2)
h.add_card(c)
h.add_card(c4)
Screen.add_asset(h)

update do
    Screen.draw_frame
    b.tick
end
show