class AddParentIdToGame < ActiveRecord::Migration[6.0]
  def change
    add_reference :games, :parent #null: false, foreign_key: true
  end
end
