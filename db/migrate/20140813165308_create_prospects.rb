class CreateProspects < ActiveRecord::Migration
  def change
    create_table :prospects do |t|
      t.string :name
      t.text :address
      t.string :city
      t.timestamps
    end
  end
end
