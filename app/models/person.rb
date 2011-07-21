class Person < ActiveRecord::Base
  set_primary_key 'indkey'
  has_ancestry
  has_many :families_as_husband, :class_name => "Family", :foreign_key => "husband_id"
  has_many :families_as_wife, :class_name => "Family", :foreign_key => "wife_id"
end
