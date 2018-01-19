class CreateSerials < ActiveRecord::Migration[5.1]
  def change
    create_table :serials do |t|
      t.string :title, null: false, unique: true, index: true
    end
  end
end
