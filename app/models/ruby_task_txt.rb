class Txt
  def append_to_file(file_name,file_entry)
    File.open("#{RAILS_ROOT.to_s}/public/#{file_name}" , "a") do |file|
      file.puts file_entry
    end
  end
end
