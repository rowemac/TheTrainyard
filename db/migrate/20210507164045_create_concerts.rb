class CreateConcerts < ActiveRecord::Migration[6.1]
  def change
    create_table :concerts do |t|
      t.datetime :date
      t.string :title
      t.string :headliner
      t.string :opener
      t.boolean :sold_out

      t.timestamps
    end
  end
end
