class ForeignKey < ActiveRecord::Migration
  def change
    add_column :employers, :user_id, :integer
    add_column :jobseekers, :user_id, :integer
  end
end
