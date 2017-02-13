class SidekiqPlayer < Player
  has_one :race, class_name: "Race", foreign_key: "sidekiq_player_id"

  def run
    SidekiqRacer.perform_async(id)
  end
end
