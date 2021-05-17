class AddCompanyIdToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :company_id, :integer
  end
end
