class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people, :force => true do |t|
      
      t.string :name
      t.string :sex

      #t.timestamps
    end
  end
end
