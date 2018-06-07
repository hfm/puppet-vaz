require 'spec_helper'
describe 'vaz' do
  let(:params) { { 'token' => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' } }

  context 'with default values for all parameters' do
    it { is_expected.to contain_class('vaz') }
    it { is_expected.to compile }
    it { is_expected.to compile.with_all_deps }
  end
end
