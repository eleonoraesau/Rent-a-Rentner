class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :category
      t.string :availability
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
