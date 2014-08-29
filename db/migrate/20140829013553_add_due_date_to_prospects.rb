class AddDueDateToProspects < ActiveRecord::Migration
  def change
    add_column :prospects, :due_date, :datetime
  end
end
