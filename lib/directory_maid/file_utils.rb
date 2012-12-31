# Monkey patching String to add lstat 
# I am sure there is a better way to do this!
module DirectoryMaid
  module FileUtils
    class ::String
      def info
        File.lstat(self)
      end
    end
  end
end
