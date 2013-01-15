require "spec_helper"

describe DirectoryMaid::Config do

  before :each do
    @config = DirectoryMaid::Config.load('./spec/support/my.yml')
  end

  it "should load a yaml config file" do
    expect {
      @config 
    }.to_not raise_error
  end
  
  it "should contain a key name directories" do
    @config.keys.include?("directories").should eq(true)  
  end

  it "should contain a key name filetypes" do
    @config.keys.include?("filetypes").should eq(true)  
  end
  
  it "should contain a key name code" do
    @config.keys.include?("source_code").should eq(true)  
  end
  
  it "should contain a key name images" do
    @config.keys.include?("images").should eq(true)  
  end
  
  it "should contain a key name audio" do
    @config.keys.include?("audio").should eq(true)  
  end

  it "should contain a key name video" do
    @config.keys.include?("video").should eq(true)  
  end

  it "should contain a key name documents" do
    @config.keys.include?("documents").should eq(true)  
  end

  it "should contain a key name junk" do
    @config.keys.include?("junk").should eq(true)  
  end


end
