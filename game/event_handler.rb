class EventHandler
    @@listeners=[]
    @@click_listeners =[]
    def self.add_listener(listener)
        @@listeners << listener
    end
    def self.add_click_listener(listener)
        @@click_listeners << listener
    end
    def self.remove_listener(listener)
        @@listeners.delete(listener)
        @@click_listeners.delete(listener)
    end
    def self.click_event(event)
        case event.button
        when :left
            @@click_listeners.each do |l|
                l.check_click(event)
            end
        when :right


        end
    end
end