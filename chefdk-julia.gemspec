# Copyright 2015 Nordstrom, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chefdk/julia/version'

Gem::Specification.new do |spec|
  spec.name          = 'chefdk-julia'
  spec.version       = ChefDK::Julia::VERSION
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

    if defined?(ChefDK::CLI)
      require 'chefdk/julia'
      chefdk.generator_cookbook ChefDK::Julia.path
    end
  EOF
end
