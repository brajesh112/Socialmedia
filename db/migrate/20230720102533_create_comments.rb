class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :body
      t.references :comment,foreign_key: {to_table: :comments}
      t.references :post
      t.timestamps
    end
  end
end
