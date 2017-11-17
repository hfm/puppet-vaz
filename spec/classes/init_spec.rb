require 'spec_helper'
describe 'vaz' do
  context 'with default values for all parameters' do
    it { should contain_class('vaz') }
  end
end
