class AddStartDateAndTimeToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :start_date, :datetime
  end
end
