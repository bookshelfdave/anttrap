Gem::Specification.new do |s|
  s.name = "anttrap"
  s.summary = "Generates an Ant build file from a Rakefile so Rake can be used from a Java IDE"
  s.description = File.read(File.join(File.dirname(__FILE__),'README'))
  s.requirements = "Rake, Ant"
  s.author = "Dave Parfitt"
  s.email = "diparfitt@gmail.com"
  s.version = "0.01"
  s.homepage = "http://github.org/metadave/anttrap"
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = ">=1.8"
  s.files = Dir['**/**']
  s.has_rdoc = false   
  s.add_dependency('builder', '>= 3.0.0')  

end
