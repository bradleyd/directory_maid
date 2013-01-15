require "yaml"

module DirectoryMaid
  module Config
    class << self

      def load(yml_file)
        config = YAML::load(File.open(yml_file))
        parse_config config
      end    

      def parse_config(config)
        config.each do |key, value|
          setter = "#{key}="
          self.class.send(:attr_accessor, key) if !respond_to?(setter)
          send setter, value
        end
      end
    end 
  end
end
