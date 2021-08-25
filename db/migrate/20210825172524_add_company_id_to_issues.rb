class AddCompanyIdToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :company_id, :integer
  end
end
