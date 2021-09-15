class AddFileToEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :file, :string
  end
end
