class AddStageRefToProspects < ActiveRecord::Migration
  def change
    add_reference :prospects, :stage, :default => "1"
  end
end
