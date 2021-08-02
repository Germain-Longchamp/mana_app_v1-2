class AddLngToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :lng, :string
  end
end
