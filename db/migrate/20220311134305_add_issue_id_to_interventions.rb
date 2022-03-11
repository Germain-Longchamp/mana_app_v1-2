class AddIssueIdToInterventions < ActiveRecord::Migration[6.0]
  def change
    add_column :interventions, :issue_id, :integer
  end
end
