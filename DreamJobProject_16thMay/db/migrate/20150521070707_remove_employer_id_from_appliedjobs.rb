class RemoveEmployerIdFromAppliedjobs < ActiveRecord::Migration
  def change
    remove_column :appliedjobs, :employer_id, :integer
  end
end
