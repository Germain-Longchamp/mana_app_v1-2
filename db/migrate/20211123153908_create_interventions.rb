class CreateInterventions < ActiveRecord::Migration[6.0]
  def change
    create_table :interventions do |t|
      t.string :name
      t.text :detail

      t.timestamps
    end
  end
end
