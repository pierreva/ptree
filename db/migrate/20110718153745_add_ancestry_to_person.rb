class AddAncestryToPerson < ActiveRecord::Migration
  def change
    add_column :people, :ancestry, :string
  end
end
