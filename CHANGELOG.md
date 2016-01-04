# Changelog for chefdk-julia

## Unreleased
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
