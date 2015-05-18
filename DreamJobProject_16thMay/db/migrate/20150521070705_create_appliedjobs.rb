class CreateAppliedjobs < ActiveRecord::Migration
  def change
    create_table :appliedjobs do |t|
      t.integer :jobseeker_id

      t.integer :employer_id

      t.integer :job_id

      t.timestamps null: false
    end
  end
end
