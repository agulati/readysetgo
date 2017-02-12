class RaceSerializer < ApplicationSerializer
  attributes :sidekiq_player, :delayedjob_player, :distance

  def sidekiq_player
    object.sidekiq_player.position
  end

  def delayedjob_player
    object.delayedjob_player.position
  end

  def distance
    object.distance
  end
end
