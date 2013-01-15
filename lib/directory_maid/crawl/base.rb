module DirectoryMaid
  class Base
    #TODO: refactor
    def self.find dir
      Find.find dir
    end

    def find 
      Find.find(self.directory)
    end

    # returns all of file in directory
    # @param [Nil]
    # @return [Enumerator] of all files in a directory

    def all
      self.find
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
        self.find.grep(regex)
      elsif opts[:name]
        regex = /#{opts[:name]}/
        self.find.grep(regex)
      elsif opts[:extension]
        # /[^\/]*\s*.png/ ???
        regex = /#{opts[:extension]}/
        self.find.grep(regex)
      else
        # raise Error
      end
    end
  end
end
