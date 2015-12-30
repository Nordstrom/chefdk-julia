# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chefdk/julia/version'

Gem::Specification.new do |spec|
  spec.name          = 'chefdk-julia'
  spec.version       = Chefdk::Julia::VERSION
  spec.authors       = ['Orion Ifland', 'Doug Ireton']
  spec.email         = ['orion.ifland@nordstrom.com', 'doug.ireton@nordstrom.com']
  spec.license       = 'Apache-2.0'

  spec.summary       = 'Custom generator for ChefDK'
  spec.description   = 'An Opinionated Cookbook creator, with spunk and a grin, by Nordstrom'
  spec.homepage      = 'https://github.com/Nordstrom/chefdk-julia'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.require_paths = ['lib']
  spec.post_install_message = <<-EOF
    Paste lines below into your ~/.chef/config.rb or knife.rb

    require 'chefdk-julia'
    chefdk.generator_cookbook Chefdk::Julia.path
  EOF
end
