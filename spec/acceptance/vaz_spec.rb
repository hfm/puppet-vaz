require 'spec_helper_acceptance'

describe 'vaz class' do
  let(:manifest) do
    <<-EOS
      class { '::vaz':
        token => 'abcdefghijklmnopqrstuvwxyzABCDEF',
      }
    EOS
  end

  it 'should work without errors' do
    result = apply_manifest(manifest, acceptable_exit_codes: [0, 2], catch_failures: true)

    expect(result.exit_code).not_to eq 4
    expect(result.exit_code).not_to eq 6
  end

  it 'should run a second time without changes' do
    result = apply_manifest(manifest)
    expect(result.exit_code).to eq 0
  end

  context 'RedHat', if: os[:family] == 'redhat' do
    describe yumrepo('vaz') do
      it { should be_enabled }
    end

    describe file('/etc/yum.repos.d/vaz.repo') do
      it { should be_file }
    end
  end

  context 'Debian', if: os[:family] =~ /^(ubuntu|debian)$/ do
    describe file('/etc/apt/sources.list.d/vaz.list') do
      it { should be_file }
      its(:content) { should match %r{^deb\s+http://repo.veeta.org/debian/\s+vaz\s+main$} }
    end
  end

  describe package('vaz') do
    it { should be_installed }
  end

  describe file('/etc/vaz.conf') do
    it { should be_file }
  end

  describe service('vaz') do
    it { should be_running }
    it { should be_enabled }
  end
end
