class DelayedjobRacer < Struct.new(:player_id)

  def perform
    DelayedjobPlayer.advance(player_id)
  end
end
