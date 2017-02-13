class SidekiqRacer
  include Sidekiq::Worker
  sidekiq_options queue: "player"

  def perform player_id
    SidekiqPlayer.advance(player_id)
  end
end
