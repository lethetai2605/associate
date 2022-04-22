class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.integer :telephone
      t.integer :age
      t.string :hobby
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
