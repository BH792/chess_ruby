class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :player_one
      t.string :player_two
      t.timestamps
    end
  end
end
