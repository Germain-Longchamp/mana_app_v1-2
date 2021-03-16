class AddRoomIdToEngines < ActiveRecord::Migration[6.0]
  def change
    add_column :engines, :room_id, :integer
  end
end
