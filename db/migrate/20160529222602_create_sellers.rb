class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.string :name, null: false
      t.string :info
      t.integer :rating

      t.timestamps null: false
    end
  end
end
