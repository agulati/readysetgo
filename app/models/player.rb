class Player < ActiveRecord::Base
  has_many :steps

  def self.advance player_id
    player = find(player_id)
    player.steps << Step.create(player: player)
  end

  def run
    raise "Implement in child class"
  end

  def done?
    position >= race.distance
  end

  def position
    steps.length
  end

  def finish_time
    steps.maximum(:created_at)
  end
end
