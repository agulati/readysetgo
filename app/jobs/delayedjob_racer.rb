class DelayedjobRacer < Struct.new(:player_id, :position)

  def perform
    DelayedjobPlayer.advance(player_id, position)
  end
end
