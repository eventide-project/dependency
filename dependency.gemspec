# -*- encoding: utf-8 -*-
Gem::Specification.new do |s|
  s.name = 'dependency'
  s.summary = 'Declare dependencies that have null object default values'
  s.version = '0.0.0'
  s.authors = ['']
  s.require_paths = ['lib']
  s.files = Dir.glob('{lib}/**/*')
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.2'

  s.add_runtime_dependency 'subst_attr'
end
