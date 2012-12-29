require "spec_helper"

describe DirectoryMaid do
  it 'should return correct version string' do
    DirectoryMaid.version_string.should == "DirectoryMaid version #{DirectoryMaid::VERSION}"
  end
end
