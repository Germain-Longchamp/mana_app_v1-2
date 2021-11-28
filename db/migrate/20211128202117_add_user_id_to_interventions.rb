class AddUserIdToInterventions < ActiveRecord::Migration[6.0]
  def change
    add_column :interventions, :user_id, :integer
  end
end
