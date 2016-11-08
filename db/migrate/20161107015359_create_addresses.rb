class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :street, :null => false
      t.string :number
      t.string :district, :null => false
      t.references :city, foreign_key: true, :null => false

      t.timestamps
    end
  end
end
