class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :size
      t.integer :year_built
      t.integer :bed
      t.integer :bath

      t.timestamps null: false
    end
  end
end
