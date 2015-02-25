# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_track/version'

Gem::Specification.new do |spec|
  spec.name = "event_track"
  spec.version = EventTrack::VERSION
  spec.authors = ["Jerry Tao"]
  spec.email = ["taojay315@gmail.com"]
  spec.summary = %q{Just another event track gem.}
  spec.description = %q{Just another event track gem.}
  spec.homepage = "htt"
  spec.license = "MIT"

  spec.files = `git ls-files -z`.split("\x0")
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'actionpack', '>= 3.0.0'
  spec.add_dependency 'railties', '>= 3.0.0'
  spec.add_dependency 'i18n', '>= 0.5.0'

  ENV['PA_ORM'] ||= 'active_record'
  case ENV['PA_ORM']
    when 'active_record'
      spec.add_dependency 'activerecord', '>= 3.0'
    when 'mongoid'
      spec.add_dependency 'mongoid', '~> 3.0'
    when 'mongo_mapper'
      spec.add_dependency 'bson_ext'
      spec.add_dependency 'mongo_mapper', '>= 0.12.0'
  end

  spec.add_development_dependency 'sqlite3', '~> 1.3.7'
  spec.add_development_dependency 'mocha', '~> 0.13.0'
  spec.add_development_dependency 'simplecov', '~> 0.7.0'
  spec.add_development_dependency 'minitest', '~> 4.7.5'
  spec.add_development_dependency 'redcarpet'
  spec.add_development_dependency 'yard', '~> 0.8'
  spec.add_development_dependency 'pry'
end
