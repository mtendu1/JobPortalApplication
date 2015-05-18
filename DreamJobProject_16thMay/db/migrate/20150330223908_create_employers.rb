class CreateEmployers < ActiveRecord::Migration
  def change
    create_table :employers do |t|
      t.string :company_name
      t.string :company_phone
      t.string :ein
      t.string :contact_person_name
      t.references :user_id

      t.timestamps null: false
    end
  end
end
