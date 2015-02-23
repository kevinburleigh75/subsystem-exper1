note = "INCLUDING #{__FILE__}"
puts '#' * (note.length + 4)
puts "# #{note} #"
puts '#' * (note.length + 4)

def self.require_path(relative_path)
  absolute_path = File.expand_path(relative_path, File.dirname(__FILE__))
  Dir["#{absolute_path}/*.rb"].each do |file|
    puts "  === requiring #{file} === "
    require file
  end
end

require_path('./role_ss')
require_path('./role_ss/models')
require_path('./role_ss/routines')
