$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "preloadables/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'preloadables'
  s.version     = Preloadables::VERSION
  s.authors     = ['Jack']
  s.email       = ['jack@ofspades.com']
  s.homepage    = 'https://jack.ofspades.com/rails-preloadables/'
  s.summary     = 'A Rails view helper that outputs HTML for preloading and precacheing.'
  s.description = 'A Rails view helper that outputs HTML for preloading and precacheing.'
  s.license     = 'Creative Commons Attribution-ShareAlike'

  s.files = Dir["{app,config,db,lib}/**/*", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.8"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'codeclimate-test-reporter'
end
