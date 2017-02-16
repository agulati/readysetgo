class CreateStep < ActiveRecord::Migration[5.0]
  def change
    create_table :steps do |t|
      t.integer :player_id
      t.timestamps
    end

    add_index(:steps, :player_id)
  end
end
