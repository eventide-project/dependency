require_relative 'test_init'

ruby_files = Dir[File.dirname(__FILE__) + '/spec/*.rb']
spec_files = ruby_files.delete_if { |file| file.end_with? '_init.rb' }

spec_files.each do |file|
  puts file
  load "./#{file}"
end
