class DelayedjobRacer < Struct.new(:player_id)

  def perform
    DelayedjobPlayer.advance(player_id)
    sleep($redis.get("wait-time") || 0)
  end
end
