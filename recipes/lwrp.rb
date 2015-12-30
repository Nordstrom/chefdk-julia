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

resource_dir = File.join(cookbook_dir, 'resources')
resource_path = File.join(resource_dir, "#{context.new_file_basename}.rb")

provider_dir = File.join(cookbook_dir, 'providers')
provider_path = File.join(provider_dir, "#{context.new_file_basename}.rb")

directory resource_dir

template resource_path do
  source 'resource.rb.erb'
  helpers(ChefDK::Generator::TemplateHelper)
end

directory provider_dir

template provider_path do
  source 'provider.rb.erb'
  helpers(ChefDK::Generator::TemplateHelper)
end
