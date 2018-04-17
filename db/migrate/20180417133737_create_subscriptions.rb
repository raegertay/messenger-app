class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true
      t.timestamps
    end

    add_index :subscriptions, [:user_id, :conversation_id], unique: true
  end
end
