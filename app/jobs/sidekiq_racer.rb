class SidekiqRacer
  include Sidekiq::Worker

  def perform player_id, position
    SidekiqPlayer.advance(player_id, position)
  end
end
