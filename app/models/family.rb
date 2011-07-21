class Family < ActiveRecord::Base
  set_primary_key 'famkey'
  belongs_to :husband, :class_name => "Person", :foreign_key => "husband_id"
  belongs_to :wife, :class_name => "Person", :foreign_key => "wife_id"
end
