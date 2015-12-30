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
files_dir = File.join(cookbook_dir, 'files', 'default')
cookbook_file_path = File.join(cookbook_dir, 'files', 'default', context.new_file_basename)

directory files_dir do
  recursive true
end

source_file = context.content_source

if source_file
  file cookbook_file_path do
    content(IO.read(source_file))
  end
else
  template cookbook_file_path do
    source 'cookbook_file.erb'
    helpers(ChefDK::Generator::TemplateHelper)
  end
end
