require 'spec_helper_acceptance'

describe 'vaz class' do
  let(:manifest) do
    <<-EOS
      class { '::vaz':
        token => 'abcdefghijklmnopqrstuvwxyzABCDEF',
      }
    EOS
  end

  it 'works without errors' do
    result = apply_manifest(manifest, acceptable_exit_codes: [0, 2], catch_failures: true)

    expect(result.exit_code).not_to eq 4
    expect(result.exit_code).not_to eq 6
  end

  it 'runs a second time without changes' do
    result = apply_manifest(manifest)
    expect(result.exit_code).to eq 0
  end

  context 'RedHat', if: os[:family] == 'redhat' do
    describe yumrepo('vaz') do
      it { is_expected.to be_enabled }
    end

    describe file('/etc/yum.repos.d/vaz.repo') do
      it { is_expected.to be_file }
    end
  end

  context 'Debian', if: os[:family] =~ %r{^(ubuntu|debian)$} do
    describe file('/etc/apt/sources.list.d/vaz.list') do
      it { is_expected.to be_file }
      its(:content) { is_expected.to match %r{^deb\s+http://repo.veeta.org/debian/\s+vaz\s+main$} }
    end
  end

  describe package('vaz') do
    it { is_expected.to be_installed }
  end

  describe file('/etc/vaz.conf') do
    it { is_expected.to be_file }
  end

  describe service('vaz') do
    it { is_expected.to be_running }
    it { is_expected.to be_enabled }
  end
end
