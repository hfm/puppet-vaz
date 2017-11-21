require 'spec_helper'
describe 'vaz' do
  let(:params) { { 'token' => 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa' } }

  context 'with default values for all parameters' do
    it { should contain_class('vaz') }
    it { should compile }
    it { should compile.with_all_deps }
  end
end
