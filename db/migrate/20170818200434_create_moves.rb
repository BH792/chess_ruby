class CreateMoves < ActiveRecord::Migration[5.1]
  def change
    create_table :moves do |t|
      t.integer :game_id
      t.integer :start_move
      t.integer :end_move
      t.integer :captured_piece
      t.string :board_array
      t.timestamps
    end
  end
end
