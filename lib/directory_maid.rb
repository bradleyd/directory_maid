require "directory_maid/version"
require "directory_maid/crawl"

module DirectoryMaid
  def self.version_string
    "DirectoryMaid version #{DirectoryMaid::VERSION}"
  end
end
