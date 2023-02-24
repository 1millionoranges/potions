class Screen
    attr_reader :name
    attr_reader :height
    attr_reader :width
    
    @@assets
    @@width
    @@height
    @@pos
    @@name

    def self.set_params(args={})
        @@assets = []
        @@width = args[:width] || 1600
        @@height = args[:height] || 1000
        @@pos = args[:pos] || Vector.new(0,0)
        @@name = 'game'
    end
    def self.draw_frame
        @@assets.each do |asset|
            asset.draw_frame do |image, position|
                new_pos = position + @@pos
                image.x = new_pos.x
                image.y = new_pos.y
            end
        end
        Mouse.draw_frame
    end
    def self.add_asset(asset)
        @@assets << asset
    end
    def self.remove_asset(asset)
        @@assets.delete(asset)
    end
    def self.init_children
        @@assets.each do |a|
            a.init_children(@pos || Vector.new(0,0))

        end
    end
end

