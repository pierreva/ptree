class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :husband_id
      t.string :wife_id

      t.timestamps
    end
  end
end
