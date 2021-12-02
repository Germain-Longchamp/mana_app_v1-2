class AddTypeIdToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :type_id, :integer
  end
end
