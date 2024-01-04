class MainApplication
    attr_accessor :path_to_saving_files, :os
    def initialize(path_to_saving_files=nil, os=nil)
        @path_to_saving_files = path_to_saving_files
        @os = os
    end
end