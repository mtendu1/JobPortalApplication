class RemoveemployerIdfromappliedjobs < ActiveRecord::Migration
  def change
    remove_column :appliedjobs, :employer_id
  end
end
