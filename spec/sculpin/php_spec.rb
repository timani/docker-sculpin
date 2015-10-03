require 'spec_helper'

# https://gist.github.com/timani/eacdd7a5430558913216

describe 'PHP extensions configuration' do

  describe file("/etc/php/conf.d/curl.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/dom.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/gd.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/iconv.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/imap.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/json.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/openssl.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/phar.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/xml.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/xsl.ini") do
    it { should be_a_file }
  end

  describe file("/etc/php/conf.d/zip.ini") do
    it { should be_a_file }
  end

end
