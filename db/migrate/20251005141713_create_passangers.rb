class CreatePassangers < ActiveRecord::Migration[8.0]
  def change
    create_table :passangers do |t|
      t.string :name
      t.string :email
      t.belongs_to :booking, null: false, foreign_key: true

      t.timestamps
    end
  end
end
