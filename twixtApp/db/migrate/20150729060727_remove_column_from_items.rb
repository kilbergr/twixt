class RemoveColumnFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :item_description, :string
  end
end
