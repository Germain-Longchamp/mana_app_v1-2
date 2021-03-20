class AddInitialDateForEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :initial_date, :date
  end
end
