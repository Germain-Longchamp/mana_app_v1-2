class RemoveIssueIdFromInterventions < ActiveRecord::Migration[6.0]
  def change
    remove_column :interventions, :issue_id, :integer
  end
end
