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

require_path('./course_ss')
require_path('./course_ss/models')
require_path('./course_ss/routines')
