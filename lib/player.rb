# lib/player.rb

# Player object for connect four
class Player
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @token = color
  end
end
