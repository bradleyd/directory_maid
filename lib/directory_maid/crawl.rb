module  DirectoryMaid
  class Crawl
    attr_accessor :directory, :files

    def initialize(opts={})
      @directory = opts.fetch(:directory, './')
      @files = find
    end

    # searches a directory 
    # @param [Hash] :name, :extension
    # @return [Array] of files that match :name or :extension
    # @TODO: add file stat for date matching etc..
    def where(opts)
      raise "No options" if opts.empty?
      
      if opts[:extension] && opts[:name]
        build_file = "#{opts[:name]}.#{opts[:extension]}"
        regex = /#{build_file}/
        @files.grep(regex)
      elsif opts[:name]
        regex = /#{opts[:name]}/
        @files.grep(regex)
      elsif opts[:extension]
        # /[^\/]*\s*.png/ ???
        regex = /#{opts[:extension]}/
        @files.grep(regex)
      else
        # raise Error
      end
    end

    # A quick directory crawl 
    # @param [String] dir is the directory you want to start crawling
    # @return [Enumerator] an Enumerator can be used to loop through the crawl results
    class << self
      def directory dir
        raise ArgumentError, "no directory given!" if dir.nil? 
        Find.find(dir)
      end
    end

    private
    def find 
      Find.find(@directory)
    end

  end
end
