class AddNameToDesigners < ActiveRecord::Migration
  def change
    add_column :designers, :name, :string, null: false, default: ""
  end
end
