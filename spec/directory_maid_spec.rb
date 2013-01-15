require "spec_helper"
require "find"

describe DirectoryMaid do
  before :each do
   @dir = "spec/support/crawl" 
   @dm  = DirectoryMaid::Crawl.new(directory: @dir)
  end

  it 'should return correct version string' do
    DirectoryMaid.version_string.should == "DirectoryMaid version #{DirectoryMaid::VERSION}"
  end

  describe DirectoryMaid::Crawl do

    it "should return an Enumerator for a given directory" do
      DirectoryMaid::Crawl.directory(@dir).class.should eq(Enumerator)
    end

  end

  describe "#where" do
    
    it "should find a file in a given directory " do
      result = @dm.where(:name => "foo")
      File.basename(result.first).should eq("foo")
    end

    it "should find files by extension type" do
      result = @dm.where(:extension => "png")
      File.basename(result.first).should eq("bar.png")
    end

    it "should find a file by name and extenion" do
      result = @dm.where(name: 'foo', :extension => "png")
      File.basename(result.first).should eq("foo.png")
    end

    it "should return an empty array if no match is found" do
      result = @dm.where(:name => "foos")
      result.empty?.should be_true
    end

  end

  describe DirectoryMaid::FileUtils do

    it "should return stat class on a file" do
      result = @dm.where(name: 'bar')
      result.first.info.class.should eq(File::Stat)
    end  

    it "should have a ctime for a specific file" do
      result = @dm.where(name: 'bar')
      result.first.info.ctime.class.should eq(Time)
    end
  end
end
