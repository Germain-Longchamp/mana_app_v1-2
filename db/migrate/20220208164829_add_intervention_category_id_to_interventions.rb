class AddInterventionCategoryIdToInterventions < ActiveRecord::Migration[6.0]
  def change
    add_column :interventions, :intervention_category_id, :integer
  end
end
