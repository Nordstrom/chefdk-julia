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

require 'chef-dk/generator'

RSpec.describe 'chefdk-julia::cookbook' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  let(:cookbook_root) { '/Users/my_user/chef/cookbooks' }
  let(:cookbook_name) { 'my_cookbook' }
  let(:new_cookbook_path) { File.join(cookbook_root, cookbook_name) }

  let(:license) { 'all_rights' }
  let(:copyright_holder) { 'Nordstrom' }

  before(:example) do
    ChefDK::Generator.reset
    ChefDK::Generator.add_attr_to_context(:use_berkshelf, true)
    ChefDK::Generator.add_attr_to_context(:cookbook_root, cookbook_root)
    ChefDK::Generator.add_attr_to_context(:cookbook_name, cookbook_name)
    ChefDK::Generator.add_attr_to_context(:have_git, true)
    ChefDK::Generator.add_attr_to_context(:skip_git_init, false)
    ChefDK::Generator.add_attr_to_context(:license, license)
    ChefDK::Generator.add_attr_to_context(:copyright_holder, copyright_holder)
  end

  it 'creates a .kitchen.yml' do
    expect(chef_run).to create_template_if_missing(
      File.join(new_cookbook_path, '.kitchen.yml')
    ).with(
      source: 'kitchen.yml.erb'
    )
  end

  it 'enables InSpec in the .kitchen.yml' do
    expect(chef_run).to render_file(File.join(new_cookbook_path, '.kitchen.yml')).with_content(
      /^  name: inspec$/
    )
  end

  it '.kitchen.yml has a Windows 2012r2 platform' do
    expect(chef_run).to render_file(File.join(new_cookbook_path, '.kitchen.yml')).with_content(
      /  - name: windows-2012r2/
    )
  end

  it 'creates a stock .rspec config file if missing' do
    expect(chef_run).to create_cookbook_file_if_missing(
      File.join(new_cookbook_path, '.rspec')
    )
  end

  it 'creates a Rakefile for running style and spec tests if missing' do
    expect(chef_run).to create_cookbook_file_if_missing(
      File.join(new_cookbook_path, 'Rakefile')
    ).with(
      backup: false
    )
  end

  it 'creates a .rubocop.yml file' do
    expect(chef_run).to create_cookbook_file_if_missing(
      File.join(new_cookbook_path, '.rubocop.yml')
    ).with(
      backup: false
    )
  end

  it 'uses SoloRunner in the generated cookbook spec' do
    expect(chef_run).to render_file(
      File.join(new_cookbook_path, '/spec/unit/recipes/default_spec.rb')
    ).with_content(
      /ChefSpec::SoloRunner\.new/
    )
  end

  it 'generated cookbook spec relies on --require spec_helper in .rspec file' do
    expect(chef_run).to render_file(File.join(new_cookbook_path, '.rspec')).with_content(
      /^--require spec_helper$/
    )

    expect(chef_run).to render_file(
      File.join(new_cookbook_path, '/spec/unit/recipes/default_spec.rb')
    ).with_content { |content|
      expect(content).to_not match(/^require ['"]spec_helper['"]$/)
    }
  end

  it 'Generated InSpec spec has a valid example spec' do
    expect(chef_run).to render_file(
      File.join(
        new_cookbook_path, '/test/integration/default/default_spec.rb'
      )
    ).with_content(/^describe command/)
  end

  context 'when generating a cookbook which uses Berkshelf' do
    it 'creates a spec_helper if missing' do
      expect(chef_run).to create_template_if_missing(
        File.join(new_cookbook_path, 'spec', 'spec_helper.rb')
      ).with(
        backup: false
      )
    end

    it 'creates a spec_helper which requires chefspec/berkshelf' do
      expect(chef_run).to render_file(
        File.join(new_cookbook_path, 'spec', 'spec_helper.rb')
      ).with_content("require 'chefspec/berkshelf'")
    end
  end

  context 'when generating a cookbook which uses Policyfiles' do
    before(:example) do
      ChefDK::Generator.add_attr_to_context(:use_berkshelf, false)
    end

    it 'creates a spec_helper which requires chefspec/policyfile' do
      expect(chef_run).to render_file(
        File.join(new_cookbook_path, 'spec', 'spec_helper.rb')
      ).with_content("require 'chefspec/policyfile'")
    end
  end
end
