class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :duration
      t.integer :status
      t.references :subscriber
      t.references :magazine
      t.timestamps
    end
  end
end
