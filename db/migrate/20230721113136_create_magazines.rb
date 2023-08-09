class CreateMagazines < ActiveRecord::Migration[7.0]
  def change
    create_table :magazines do |t|
      t.string :title
      t.decimal :price, precision: 5, scale: 2
      t.timestamps
    end
  end
end
