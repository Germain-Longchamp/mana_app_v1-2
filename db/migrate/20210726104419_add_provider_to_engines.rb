class AddProviderToEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :provider, :string
  end
end
