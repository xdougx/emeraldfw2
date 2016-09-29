# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'emeraldfw/version'

Gem::Specification.new do |spec|
  spec.name          = "emeraldfw"
  spec.version       = EmeraldFW::VERSION
  spec.authors       = ["Ed de Almeida"]
  spec.email         = ["edvaldoajunior@gmail.com"]

  spec.summary       = "Emerald Framework is a full-stack web development framework designed for the strong!"
  spec.description   = "WARNING: THIS IS AN ALPHA VERSION! Emerald Framework is a full-stack web development framework designed for the strong! It enforces good programming practices; privileges convention over configuration; completely separates code and UI; allows the developer to choose the language desired and allows the insertion of new languages; and integrates development with many useful services in the web, like Trello and SandCage. If you want to contribute to this great framework, drop a message to emerald.framework@gmail.com telling us about your skills as a developer."
  spec.homepage      = "https://github.com/EdDeAlmeidaJr/emeraldfw"
  spec.license       = "MIT"

  spec.author        = "Ed de Almeida"
  spec.email         = "edvaldoajunior@gmail.com"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|files)/}) }
  spec.bindir        = "bin"
  spec.executables   = [ 'emeraldfw' ]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "slop", "~> 4.4"
  spec.add_runtime_dependency "nokogiri", "~> 1.6"
  spec.add_runtime_dependency "colorize", "~> 0.8"
  spec.add_runtime_dependency "rubyzip", "~> 1.2"
  spec.add_runtime_dependency "httparty", "~> 0.14"
  spec.add_runtime_dependency "json", "~> 2.0"
end
