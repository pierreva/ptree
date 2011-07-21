#!/usr/bin/env ruby
require 'ged_parse'
require 'pp'

#ged_filename = "Aigrot.ged"
ged_filename = File.join(File.dirname(__FILE__), "Test_arbre.ged")

#puts ged_filename

g = GedParse::Gedcom.new(ged_filename)


g.families.each do |family|
  @fam = Family.new
  @fam.famkey = family.gid.gsub(/@/,"").gsub(/F/,"")

  if family.husband
    @fam.husband_id = family.husband.gid.gsub(/@/,"").gsub(/I/,"")
    @father = Person.new
    @father.indkey = family.husband.gid.gsub(/@/,"").gsub(/I/,"")
    @father.name = family.husband.name
    @father.sex = "M"
    @father.save
  end
  if family.wife
    @fam.wife_id = family.wife.gid.gsub(/@/,"").gsub(/I/,"")
    @mother = Person.new
    @mother.indkey = family.wife.gid.gsub(/@/,"").gsub(/I/,"")
    @mother.name = family.wife.name
    @mother.sex = "F"
    @mother.save

  end


  @fam.save
  @fam = nil
end
g.individuals.each do |individual|
pp individual.details
  individual.details.each do |detail|

    if detail[:field] == "FAMC"
      
      #puts detail[:value].gsub(/@/,"")
       f = Family.find(detail[:value].gsub(/@/,"").gsub(/F/,""))
       # f.husband_id : father f.wife_id : mother
      @pers = Person.where(:indkey => individual.gid.gsub(/@/,"").gsub(/I/,""))
      @pers.update_all(:ancestry => "#{f.husband_id}/#{f.wife_id}")
      
    end



  end


end