class AddValidityStartDateForEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :validity_start_date, :date
  end
end
