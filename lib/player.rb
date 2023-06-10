# lib/player.rb
require "colorize"

# Player object for connect four
class Player
  attr_reader :name, :token

  def initialize(name, color)
    @name = name
    @token = '◯'.colorize(color.to_sym)
  end
end
