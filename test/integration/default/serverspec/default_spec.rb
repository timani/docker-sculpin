require 'spec_helper'

# https://gist.github.com/timani/9654d5ca8fbdbebafdcf

describe 'OS and core packages' do

  describe command('cat /etc/issue') do
    its(:stdout) { should match 'Alpine Linux' }
  end

  describe package('git') do
    it { should be_installed }
  end

  describe package('tar') do
    it { should be_installed }
  end

  describe package('zip') do
     it { should be_installed }
  end

  describe command('which composer') do
     its(:stdout) { should match '/usr/local/bin/composer' }
  end

  describe command('which sculpin') do
     its(:stdout) { should match '/usr/local/bin/sculpin' }
  end

end
