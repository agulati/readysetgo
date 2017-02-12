class CreateRace < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.integer :sidekiq_player_id
      t.integer :delayedjob_player_id
      t.integer :distance
      t.timestamps
    end
  end
end
