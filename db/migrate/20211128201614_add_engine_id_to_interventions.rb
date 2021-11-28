class AddEngineIdToInterventions < ActiveRecord::Migration[6.0]
  def change
    add_column :interventions, :engine_id, :integer
  end
end
