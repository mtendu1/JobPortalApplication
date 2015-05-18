class AddAddressToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :address, :string
  end
end
