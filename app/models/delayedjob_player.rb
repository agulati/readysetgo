class DelayedjobPlayer < Player
  has_one :race, class_name: "Race", foreign_key: "delayedjob_player_id"

  def run
    Delayed::Job.enqueue(DelayedjobRacer.new(id))
  end
end
