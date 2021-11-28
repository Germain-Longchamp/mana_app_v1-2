class AddCompanyIdToInterventions < ActiveRecord::Migration[6.0]
  def change
    add_column :interventions, :company_id, :integer
  end
end
