require 'puppetlabs_spec_helper/module_spec_helper'

RSpec.configure do |c|
  c.formatter = :documentation
  c.default_facts = {
    osfamily: 'Debian',
    os: {
      family: 'Debian',
      name: 'Debian',
      release: {
        major: '9',
        minor: '2',
        full: '9.2'
      }
    }
  }

  c.after(:suite) do
    RSpec::Puppet::Coverage.report!
  end
end
