class AddProviderInfoToEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :provider_info, :text
  end
end
