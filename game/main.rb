require 'ruby2d'
require './pet.rb'
require './guy.rb'
require './screen.rb'
require './physics.rb'
require './battle.rb'
require './event_handler.rb'
require './click_listener.rb'
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
set height: Screen.height
set width: Screen.width
b = Battle.new

Screen.add_asset(b)
g1 = Guy.new
g2 = Guy.new(pos: Vector.new(100,0))
g1.set_target(g2)
g2.set_target(g1)
b.add_fighter(g1)
b.add_fighter(g2)
update do
    Screen.draw_frame
    b.tick
end
show