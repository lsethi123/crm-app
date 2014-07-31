class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :company
      t.string :phone
      t.string :email
      t.references :customer, index: true

      t.timestamps
    end
  end
end
