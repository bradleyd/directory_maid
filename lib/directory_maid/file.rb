module DirectoryMaid
  class File
    class << self
      def info
        File.lstat self
      end
    end
  end
end
