class Race < ApplicationRecord
  belongs_to :sidekiq_player,     class_name: "SidekiqPlayer"
  belongs_to :delayedjob_player,  class_name: "DelayedjobPlayer"

  default_scope {  includes(:sidekiq_player)
                  .includes(:delayedjob_player)
                  .order(created_at: :desc) }

  validates :distance, presence: true

  def self.start opts={}
    race                    = new(opts)
    race.sidekiq_player     = SidekiqPlayer.new
    race.delayedjob_player  = DelayedjobPlayer.new
    race.save!

    RaceRunner.perform_async(race.id)
    race
  end

  def run
    distance.times do
      sidekiq_player.run
      delayedjob_player.run
    end
  end

  def done?
    sidekiq_player.done? || delayedjob_player.done?
  end

  def winner
    if done?
      if sidekiq_player.finish_time < delayedjob_player.finish_time
        "sidekiq"
      elsif sidekiq_player.finish_time > delayedjob_player.finish_time
        "delayedjob"
      else
        "tie"
      end
    end
  end

  def loser
    if done?
      if sidekiq_player.finish_time > delayedjob_player.finish_time
        "sidekiq"
      elsif sidekiq_player.finish_time < delayedjob_player.finish_time
        "delayedjob"
      else
        "tie"
      end
    end
  end

  def duration_percentage
    send("#{winner}_player".to_sym).duration / send("#{loser}_player".to_sym).duration * 100
  end
end
