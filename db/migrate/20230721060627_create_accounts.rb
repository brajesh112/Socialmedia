class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :user_name
      t.references :user
      t.timestamps
    end
  end
end
