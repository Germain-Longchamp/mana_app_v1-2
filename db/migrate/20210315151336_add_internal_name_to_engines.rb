class AddInternalNameToEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :internal_name, :string
  end
end
