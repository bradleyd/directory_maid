require_relative 'crawl/base'

module  DirectoryMaid
  # a class the wraps #find and returns either an enumerator 
  # or an Array
  # @param [String] opts is opts includes directory
  # @return [Enumerator, Array, Class]
  class Crawl < DirectoryMaid::Base
    include DirectoryMaid::FileUtils
    attr_accessor :directory, :files

    def initialize(opts={})
      @directory = opts.fetch(:directory, './')
    end


    # A quick directory crawl 
    # @param [String] dir is the directory you want to start crawling
    # @return [Enumerator] an Enumerator can be used to loop through the crawl results
    class << self
      def directory dir
        raise ArgumentError, "no directory given!" if dir.nil? 
        find(dir)
      end
    end
  end
end
