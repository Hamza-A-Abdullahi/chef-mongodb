# InSpec test for recipe mongodb::default

# The InSpec reference, with examples and extensive documentation, can be
# found at https://www.inspec.io/docs/reference/resources/

  

# This is an example test, replace it with your own test.
describe service 'mongod' do
  it(should be_installed)
  it(should be_installed.with_version('3.x.x'))
  its('version'){should match /3\./}
end
