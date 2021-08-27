class AddInfoToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :info, :text
  end
end
