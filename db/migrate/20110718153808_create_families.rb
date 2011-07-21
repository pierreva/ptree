class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families, :force => true do |t|

      t.string :husband_id
      t.string :wife_id

      t.timestamps
    end
  end
end
