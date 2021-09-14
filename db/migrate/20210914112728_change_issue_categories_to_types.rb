class ChangeIssueCategoriesToTypes < ActiveRecord::Migration[6.0]
  def change
    rename_table :issue_categories, :types
  end
end
