class RaceRunner
  include Sidekiq::Worker
  sidekiq_options queue: "race"

  def perform race_id
    race = Race.find(race_id)
    race.run
  end
end
