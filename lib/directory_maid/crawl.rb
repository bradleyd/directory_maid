module  DirectoryMaid
  class Crawl
    attr_accessor :directory

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
      if opts[:name]
        @files.select { |e| e if File.basename(e) == opts[:name]  }
      elsif opts[:extension]
        @files.select { |e| e if File.extname(File.basename(e)) == ".#{opts[:extension]}"  }
      elsif opts[:extension] && opts[:name]
        @files.select { |e| 
          e if File.extname(File.basename(e)) == ".#{opts[:extension]}" && 
          File.basename(e) == opts[:name]  
        }
      else
        #TODO need to limit this to only first 25 
        @files.to_a
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
