class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :size
      t.integer :year_built
      t.integer :bed
      t.integer :bath
      t.belongs_to :seller
      t.timestamps null: false
    end
  end
end
