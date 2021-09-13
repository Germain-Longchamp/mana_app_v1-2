class AddCompanyIdToIssueCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :issue_categories, :company_id, :integer
  end
end
