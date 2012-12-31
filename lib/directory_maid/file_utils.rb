#class String
#  def self.info
#    File.lstat(self)
#  end
#end

module DirectoryMaid
  class FileUtils
    class << self
      def info
        File.lstat self.class
      end
    end
  end
end
