class AddUserIdToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :user_id, :integer
  end
end
