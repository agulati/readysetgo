module RacesHelper

  def format_racer race, player
    if race.winner == player
      "winner"
    elsif race.loser == player
      "loser"
    else
      ""
    end
  end
end
