class SidekiqRacer
  include Sidekiq::Worker
  sidekiq_options queue: "player"

  def perform player_id
    SidekiqPlayer.advance(player_id)
    sleep($redis.get("wait-time") || 0)
  end
end
