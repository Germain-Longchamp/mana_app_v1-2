class AddLatToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :lat, :string
  end
end
