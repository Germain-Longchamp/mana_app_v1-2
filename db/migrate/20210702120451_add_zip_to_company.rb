class AddZipToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :zip, :string
  end
end
