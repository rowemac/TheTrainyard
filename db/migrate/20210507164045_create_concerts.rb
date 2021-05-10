class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.date :date
      t.time :time
      t.string :headliner
      t.string :opener
      t.boolean :sold_out, default: false
      t.integer :price

      t.timestamps
    end
  end
end
