class CreatePlatform < ActiveRecord::Migration[6.0]
  def change
    create_table :platforms do |t|
      t.string :name
      t.integer :category
    end
  end
end
