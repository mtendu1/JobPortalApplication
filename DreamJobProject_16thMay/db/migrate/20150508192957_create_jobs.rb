class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company_name
      t.string :job_title
      t.string :job_code
      t.string :job_location
      t.string :job_description
      t.string :job_type
      t.date :date

      t.timestamps null: false
    end
  end
end
