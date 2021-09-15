class AddValidationFileToIssues < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :validation_file, :string
  end
end
