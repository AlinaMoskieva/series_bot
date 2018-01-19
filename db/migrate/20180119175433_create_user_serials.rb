class CreateUserSerials < ActiveRecord::Migration[5.1]
  def change
    create_table :users_serials do |t|
      t.belongs_to :user, null: false, index: true
      t.belongs_to :serial, null: false, index: true
    end
  end
end
