# chefdk-julia
[![Gem Version](https://badge.fury.io/rb/chefdk-julia.svg)](https://badge.fury.io/rb/chefdk-julia)
[![Build Status](https://travis-ci.org/Nordstrom/chefdk-julia.svg?branch=master)](https://travis-ci.org/Nordstrom/chefdk-julia)

<img src='https://cdn.rawgit.com/Nordstrom/chefdk-julia/master/julia-icon.svg' style='float:left'/>

An opinionated cookbook creator.

Julia makes it easy to generate full-featured starting cookbooks, recipes, templates, etc.
with testing already set up (e.g. ChefSpec).

## About
Julia is a special type of Chef cookbook that is designed to generate code (cookbooks, recipes, templates, etc.).

## How is it better than the basic ChefDK generator?

Generated Cookbooks will contain:

1. Rakefile with RuboCop, Foodcritic, and ChefSpec tasks.
2. RSpec spec_helper.rb file set up to disallow global monkey-patching and allow focusing single tests.
3. .rspec file which auto-requires spec_helper.rb in specs
4. .rubocop.yml file with line length set to 100.
5. [InSpec](https://docs.chef.io/compliance.html#audit-resources) set up for integration testing instead of ServerSpec


## Prerequisites
[ChefDK](https://downloads.chef.io/chef-dk/) version 0.10 or greater must already be installed.

## Installation

### Install the Gem:

```bash
> chef gem install chefdk-julia
```

### Configure Your `knife.rb`:
Add these lines to your `~/.chef/config.rb` or `~/.chef/knife.rb` configuration file:

```ruby
# Paste lines below into ~/.chef/config.rb or knife.rb
if defined?(ChefDK::CLI)
  require 'chefdk/julia'
  chefdk.generator_cookbook ChefDK::Julia.path
end
```

## Generating a cookbook
Once chefdk-julia is installed, you should be able to generate a cookbook with the `chef generate cookbook` command:

```bash
> chef generate cookbook the_art_of_french_cooking
```

where '*the_art_of_french_cooking*' is the name of the cookbook you want to create.

## License

chefdk-julia: A custom cookbook generator based on ChefDK's built-in generator.

### Authors
Orion Ifland, Doug Ireton

Copyright (c) 2015 Nordstrom, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
