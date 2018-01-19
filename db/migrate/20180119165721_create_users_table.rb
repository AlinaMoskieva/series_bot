class CreateUsersTable < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :chat_id, null: false, unique: true, index: true
    end
  end
end
