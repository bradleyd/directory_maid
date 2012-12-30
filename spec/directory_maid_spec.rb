require "spec_helper"
require "find"
describe DirectoryMaid do
  before :each do
   @dir = "spec/support/crawl" 
   @png = "bar.png"
   @dm  = DirectoryMaid::Crawl.new(directory: @dir)
  end

  it 'should return correct version string' do
    DirectoryMaid.version_string.should == "DirectoryMaid version #{DirectoryMaid::VERSION}"
  end

  describe DirectoryMaid::Crawl do

    it "should return an Enumerator for a given directory" do
      DirectoryMaid::Crawl.directory(@dir).class.should eq(Enumerator)
    end

    it "should find a file `foo` in a given directory " do
      result = @dm.where(:name => "foo")
      File.basename(result.first).should eq("foo")
    end

    it "should find files by extension type" do
      reg = File.join(@dir, "*.png")
      result = @dm.where(:extension => "png")
      File.basename(result.first).should eq("bar.png")
    end

  end
end