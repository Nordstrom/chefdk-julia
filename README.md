# chefdk-julia
An Opinionated Cookbook creator.

_with spunk and a grin, by Nordstrom_

## About
Julia is a special type of Chef cookbook that is designed to generate code (cookbooks, recipes, templates, etc.).

It is based upon the default code_generator provided by ChefDK.
(`chef generate generator`).

## Prerequisites
[ChefDK](https://chef.io/downloads) must already be installed.

## Installation
`chefdk-julia` is distributed as a Ruby Gem.

Install it with `chef gem install` on the command line.

```bash
> chef gem install chefdk-julia
```

Add these lines to your `~/.chef/config.rb` or `~/.chef/knife.rb` configuration file:

```ruby
# Paste lines below into ~/.chef/config.rb or knife.rb
require 'chefdk-julia'
chefdk.generator_cookbook Chefdk::Julia.path
```

## Generating a cookbook
Once chefdk-julia is installed, you should be able to generate a cookbook with the `chef generate cookbook` command:

```bash
> chef generate cookbook the_art_of_french_cooking
```

where '*the_art_of_french_cooking*' is the name of the cookbook you want to create.
