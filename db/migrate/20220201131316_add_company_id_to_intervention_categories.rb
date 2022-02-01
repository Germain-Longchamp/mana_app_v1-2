class AddCompanyIdToInterventionCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :intervention_categories, :company_id, :integer
  end
end
