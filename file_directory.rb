require 'fileutils'

# create a directory if not exist
dir_name = "testDir"
Dir.mkdir(dir_name) unless Dir.exist? dir_name

# or use FileUtils
dir_name_utils = dir_name + "fileUtils"
FileUtils.mkdir dir_name_utils unless Dir.exist? dir_name_utils

# copy file
file_to_copy = 
samples_path = "Real Samples/TextFiles"
FileUtils.copy("mydoc.xml","mydoc_copy.xml")
FileUtils.copy("mydoc.xml","#{dir_name}/mydoc_copy.xml")
FileUtils.copy("#{samples_path}/62479176.PDF.txt",dir_name)

# copy directory, and create path if the target directory doesn't exist 
FileUtils.cp_r(dir_name, "#{dir_name_utils}/#{dir_name}")
