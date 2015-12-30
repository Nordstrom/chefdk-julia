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

context = ChefDK::Generator.context
cookbook_dir = File.join(context.cookbook_root, context.cookbook_name)
recipe_path = File.join(cookbook_dir, 'recipes', "#{context.new_file_basename}.rb")
spec_helper_path = File.join(cookbook_dir, 'spec', 'spec_helper.rb')
spec_path = File.join(
  cookbook_dir, 'spec', 'unit', 'recipes', "#{context.new_file_basename}_spec.rb"
)

# Chefspec
directory "#{cookbook_dir}/spec/unit/recipes" do
  recursive true
end

cookbook_file spec_helper_path do
  action :create_if_missing
end

template spec_path do
  source 'recipe_spec.rb.erb'
  helpers(ChefDK::Generator::TemplateHelper)
  action :create_if_missing
end

# Recipe
template recipe_path do
  source 'recipe.rb.erb'
  helpers(ChefDK::Generator::TemplateHelper)
end
