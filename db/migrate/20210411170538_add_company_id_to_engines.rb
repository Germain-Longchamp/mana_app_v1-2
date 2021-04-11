class AddCompanyIdToEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :company_id, :integer
  end
end
