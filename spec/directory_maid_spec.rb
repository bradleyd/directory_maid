require "spec_helper"

describe DirectoryMaid do
  it 'should return correct version string' do
    DirectoryMaid.version_string.should == "DirectoryMaid version #{DirectoryMaid::VERSION}"
  end

  describe DirectoryMaid::Crawl do
    it "should list directory entries" do
     #
    end
  end
end
