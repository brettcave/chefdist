require 'thor'
require 'chefdist'

module Chefdist
  class CLI < Thor

    desc "dist [SOURCE] [DEST]", "Create a distribution. SOURCE is required."
    def dist(source, path = nil)
      if source.nil?
        raise ArgumentError, "source can not be null"
      end

      if ! File::exists?(source)
        raise IOError, "Source (#{source}) must exist"
      end

      if path.nil?
        path ||= File.join(Dir.pwd, "chefdist-#{Time.now.to_i}.tar.gz")
      else
        path = File.expand_path(path)
      end

      chefdist = Chefdist::Packager.new(source)
      puts "Wrote '" + chefdist.dist(path) + "'"
    end
  end
end