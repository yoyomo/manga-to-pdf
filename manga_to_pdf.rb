require 'rmagick'
require 'fileutils'

def manga_to_pdf(folder_path,delete_folder=false)
	output_name = folder_path.split('/')[-1]
	output_path = folder_path

	Dir.entries(folder_path).sort.map do |volume_path|
		manga_page_list = Magick::ImageList.new()
		next if volume_path == '.' || volume_path == '..'
		next unless File.directory?(folder_path+'/'+volume_path)
		Dir.entries(folder_path+'/'+volume_path).sort.map do |page_path|
			file_type = page_path.split('.')[-1]
			next unless file_type == 'jpg' || file_type == 'JPG' || file_type == 'jpeg'
			File.open(folder_path+'/'+volume_path+'/'+page_path, 'rb') do |page| 
				manga_page_list.push(Magick::Image::read(page).first)	
			end				
		end
		volume_number = volume_path.scan(/\d+/).last
		manga_page_list.write("#{output_path}/#{output_name}_#{volume_number}.pdf")
		puts "#{output_name}_#{volume_number}"

		FileUtils.rm_rf(folder_path+'/'+volume_path) if delete_folder
	end

end

if ARGV.length == 0
  puts "Usage: ruby manga_to_pdf.rb FOLDER_PATH [DELETE_FOLDER]"
  return 
end

folder_path = ARGV[0]
delete_folder = ARGV[1]
manga_to_pdf(folder_path,delete_folder)
