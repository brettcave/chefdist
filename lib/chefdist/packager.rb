require 'archive/tar/minitar'
require 'zlib'

module Chefdist

  class Packager
    class << self
      def validate_destination(path)
        path = path.to_s
      end
    end

    attr_reader :source_list

    def initialize(sourcedir)
      @source_list = sourcedir.to_s
    end

    def dist(dest)
      Dir.chdir(source_list) do |dir|
        tgz = Zlib::GzipWriter.new(File.open(dest.to_s,"wb"))
        Archive::Tar::Minitar.pack(".",tgz)
      end
      dest
    rescue SystemCallError => ex
      raise PackageError, ex
    end
  end

end