# -*- encoding: utf-8 -*-
VERSION = "0.3"

Gem::Specification.new do |spec|
  spec.name          = "yesyoucam"
  spec.version       = VERSION
  spec.authors       = ["Gant"]
  spec.email         = ["GantMan@gmail.com"]
  spec.description   = %q{Quickly and easily implment camera functions in RubyMotion Android}
  spec.summary       = %q{Quickly and easily use the Android camera functions in RubyMotion for Android.}
  spec.homepage      = "https://github.com/GantMan/yesyoucam"
  spec.license       = "MIT"

  files = []
  files << 'README.md'
  files.concat(Dir.glob('lib/**/*.rb'))
  spec.files         = files
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rake"
  spec.add_runtime_dependency 'bluepotion'
end
