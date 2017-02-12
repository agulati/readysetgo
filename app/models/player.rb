class Player < ActiveRecord::Base
  validates :position, presence: true

  def self.advance player_id, position
    player = find(player_id)
    player.update_attributes(position: position)
  end

  def run
    raise "Implement in child class"
  end

  def done?
    position >= race.distance
  end
end
