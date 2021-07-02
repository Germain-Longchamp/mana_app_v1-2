class AddDepartmentToCompany < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :department, :string
  end
end
