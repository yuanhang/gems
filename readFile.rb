require 'rexml/document'

include REXML
file = File.new("mydoc.xml")
doc = Document.new file

# access elements and attributes
doc.elements.each("inventory/section") do |element|
  puts element.attributes["name"]
end

doc.elements.each("*/section/item") do |element|
  puts element.attributes["upc"]
end

root = doc.root
puts root.attributes["title"]

# search (or filter) using xpath
puts root.elements["section/item[@stock='44']"].attributes["upc"]

puts root.elements["section"].attributes["name"] 
# -> health (returns the first encountered matching element) 

# access using index, note: the index starts from "1"
puts root.elements[1].attributes["name"] 
# -> health (returns the FIRST child element) 

