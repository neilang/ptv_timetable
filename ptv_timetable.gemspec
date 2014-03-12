# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ptv_timetable/version'

Gem::Specification.new do |spec|
  spec.name          = "ptv_timetable"
  spec.version       = PtvTimetable::VERSION
  spec.authors       = ["Neil Ang"]
  spec.email         = ["neilang@gmail.com"]
  spec.summary       = %q{A ruby gem for interacting with the PTV timetable API.}
  spec.description   = %q{A ruby gem for interacting with the PTV timetable API.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "httparty", "~> 0.13.0"
end
