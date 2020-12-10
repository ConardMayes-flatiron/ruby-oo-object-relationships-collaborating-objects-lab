require "pry"
class MP3Importer
    attr_accessor :path

    @@files = []

    def initialize(path)
        @path = path
    end

    def files
        just_files =[]
        file_paths = Dir["#{@path}/*.mp3"]
        file_paths.each { |file_path| just_files << (file_path.split("/"))[-1]}
        just_files
    end

    def import
        self.files.each do |file|
            @@files << Song.new_by_filename(file)
        end
    end

end
