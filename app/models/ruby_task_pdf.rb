require 'rubygems'
require 'pdf/toolkit'
require 'pdf/writer'

class Pdf
    
  def append_to_file(file_name,file_entry)
    resume = PDF::Writer.new()
    resume.text(file_entry.split(","))
    resume_file_stream = resume.render()
    File.open("#{RAILS_ROOT.to_s}/public/#{file_name}", "w") do |file|
      file.puts resume_file_stream
    end
  end
end
