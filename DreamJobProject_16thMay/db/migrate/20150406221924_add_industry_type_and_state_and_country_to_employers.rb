class AddIndustryTypeAndStateAndCountryToEmployers < ActiveRecord::Migration
  def change
    add_column :employers, :Industry_type, :string
    add_column :employers, :State, :string
    add_column :employers, :Country, :string
  end
end
