class Race < ApplicationRecord
  validates :distance, presence: true

  belongs_to :sidekiq_player,     class_name: "SidekiqPlayer"
  belongs_to :delayedjob_player,  class_name: "DelayedjobPlayer"

  def self.start opts={}
    race                    = new(opts)
    race.sidekiq_player     = SidekiqPlayer.new(position: 0)
    race.delayedjob_player  = DelayedjobPlayer.new(position: 0)
    race.save!

    race.run
    race
  end

  def run
    distance.times do |x|
      sidekiq_player.run(x+1)
      delayedjob_player.run(x+1)
    end
  end

  def done?
    sidekiq_player.done? || delayedjob_player.done
  end
end
