# Changelog for chefdk-julia

## 1.0.0
* Set InSpec as the verifier in generated .kitchen.yml [#22](https://github.com/Nordstrom/chefdk-julia/issues/22)

* Remove support for ServerSpec

* Switch from ServerRunner to SoloRunner in generated specs [#21](https://github.com/Nordstrom/chefdk-julia/issues/21)

* Remove `require 'spec_helper'` line from generated specs [#20](https://github.com/Nordstrom/chefdk-julia/issues/20)

* Remove berksfile.lock from generated .gitignore [#18](https://github.com/Nordstrom/chefdk-julia/issues/18)

* Add minimum ChefDK version in README [#14](https://github.com/Nordstrom/chefdk-julia/issues/14)

* Add Windows platform to generated .kitchen.yml

* Add ChefSpec coverage task to generated Rakefile

## 0.4.4
* Fix foodcritic.options[:fail_tags] in generated cookbook Rakefile

* Add "How is it better than the basic ChefDK generator?" section to README

## 0.4.3
* Update README and gem post-install message with correct require statement

## 0.4.2
* Fix ERROR: Could not find cookbook(s) to satisfy run list ["recipe[chefdk-julia-0.4.1::cookbook]"]
  See https://github.com/chef/chef-dk/issues/633

## 0.4.1
* Add Travis-CI test and deploy support

## 0.4.0
* Distribute chefdk-julia as a Ruby gem.

## 0.3.0
* Generated cookbook passes Rubocop, Foodcritic, and RSpec

## 0.2.0
The generated cookbook will contain:
* Rakefile with RuboCop, Foodcritic, and ChefSpec tasks.
* .rubocop.yml file with line length set to 100.

## 0.1.0
Initial version
