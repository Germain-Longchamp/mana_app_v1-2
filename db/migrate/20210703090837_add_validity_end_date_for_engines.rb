class AddValidityEndDateForEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :validity_end_date, :date
  end
end
