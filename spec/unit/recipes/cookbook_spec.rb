require 'chef-dk/generator'

RSpec.describe 'chefdk-julia::cookbook' do
  def generator_context(use_berkshelf: true)
    double('generator_context',
           cookbook_root: '/Users/my_user/chef/cookbooks',
           cookbook_name: 'my_cookbook',
           use_berkshelf: use_berkshelf,
           have_git: true,
           skip_git_init: false
          )
  end

  before(:example) do
    allow(ChefDK::Generator).to receive(:context).and_return(generator_context)
  end

  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }
  let(:new_cookbook_path) { '/Users/my_user/chef/cookbooks/my_cookbook' }

  it 'creates a stock .rspec config file if missing' do
    expect(chef_run).to create_cookbook_file_if_missing(File.join(new_cookbook_path, '.rspec'))
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
      allow(ChefDK::Generator).to receive(:context).and_return(
        generator_context(use_berkshelf: false)
      )
    end

    it 'creates a spec_helper which requires chefspec/policyfile' do
      expect(chef_run).to render_file(
        File.join(new_cookbook_path, 'spec', 'spec_helper.rb')
      ).with_content("require 'chefspec/policyfile'")
    end
  end
end
