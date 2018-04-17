class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.references :conversation, foreign_key: true
      t.text :content, null: false, default: ''
      t.timestamps
    end
  end
end
