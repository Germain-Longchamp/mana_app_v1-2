class AddEngineIdToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :engine_id, :integer
  end
end
