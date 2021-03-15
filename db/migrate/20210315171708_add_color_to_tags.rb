class AddColorToTags < ActiveRecord::Migration[6.0]
  def change
    add_column :tags, :tag_color, :string
  end
end
