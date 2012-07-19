class CreatePeriodicals < ActiveRecord::Migration
  def change
    create_table :periodicals do |t|
      t.string :resource
      t.string :hashed_resource
      t.string :name
      t.string :category
      t.text :description

      t.timestamps
    end
    add_index :periodicals, :hashed_resource
  end
end
