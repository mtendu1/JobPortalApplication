class CreateJobseekers < ActiveRecord::Migration
  def change
    create_table :jobseekers do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.references :user_id

      t.timestamps null: false
    end
  end
end
