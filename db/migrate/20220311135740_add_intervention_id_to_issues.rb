class AddInterventionIdToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :intervention_id, :integer
  end
end
