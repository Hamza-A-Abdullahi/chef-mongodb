#
# Cookbook:: mongodb
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongodb::default' do
  context 'When all attributes are default, on Ubuntu 18.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '18.04'
    it 'converges successfully' do
      expect{chef_run }.to_not raise_error
    end
    it 'should update the sources list' do
      expect(chef_run).to update_apt_update 'update_sources'
    end
    it 'should add mongodb-org to the source list' do
      expect(chef_run).to add_apt_repository ('mongodb-org')
    end
    it 'should install mongodb' do
      expect(chef_run).to install_package 'mongodb-org'
    end
  end
end
