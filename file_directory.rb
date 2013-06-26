require 'fileutils'
require 'find'

# create a directory if not exist
dir_name = "testDir"
Dir.mkdir(dir_name) unless Dir.exist? dir_name

# or use FileUtils
dir_name_utils = dir_name + "fileUtils"
FileUtils.mkdir dir_name_utils unless Dir.exist? dir_name_utils
# create path
deep_path = File.join dir_name, dir_name, dir_name, dir_name
FileUtils.mkdir_p deep_path

# copy file
#file_to_copy = samples_path = "Real Samples/TextFiles"
out_file = "mydoc_copy.o"
FileUtils.copy("mydoc.xml", out_file)
FileUtils.copy("mydoc.xml","#{dir_name}/#{out_file}")
FileUtils.copy("#{dir_name}/#{out_file}", deep_path)

# create a directory and all its parent directories
FileUtils.mkdir_p 'test1/test2/test3'

# copy directory, and create path if the target directory doesn't exist 
FileUtils.cp_r(dir_name, "#{dir_name_utils}/#{dir_name}")

# get current directory name
File.basename(Dir.getwd)

# find file in current dir
Dir.glob("*") { |path| puts "do sth" if path =~ /some regex/i}
# or 
Find.find(Dir.getwd) do |path|
    if FileTest.directory? path
        # ignore this dir and its containings, continue
        Find.prune 
    else
        puts "do sth" if path =~ /some regex/i
    end
end

# delete folder by pattern
#  usage: delete_dir Dir.getwd, /debug|release|obj|bin/i
def delete_dir dir, pattern
    puts dir
    puts pattern
    Find.find(dir) do |path|
        if FileTest.directory? path
            # ?. means the ascii char of '.' same as '.'.chr, "."[0].chr
            # this is to avoid the directory start with "."
            if File.basename(path)[0] == ?.
                Find.prune
            else
                if File.basename(path) =~ pattern
                    puts "remove #{path}."
                    rm_rf path
                else
                    next
                end
            end
        end
    end
end

# get file name with/without extension
file = "/usr/local/dir/somefile.rb"
puts "file name: #{File.basename(file)}"
puts "file extension: #{File.extname(file)}"
puts "file without extension: #{File.basename(file, ".*")}"

