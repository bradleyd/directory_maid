require "directory_maid/version"
require "directory_maid/file_utils"
require "directory_maid/crawl"
require "directory_maid/config"
require "find"

module DirectoryMaid
  def self.version_string
    "DirectoryMaid version #{DirectoryMaid::VERSION}"
  end

  def self.symbolize_keys! hash
    keys.each do |key|
      hash[(key.to_sym rescue key) || key] = delete(key)
    end
    hash
  end
end
