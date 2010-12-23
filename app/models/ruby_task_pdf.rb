require 'rubygems'
require 'pdf/toolkit'
require 'pdf/writer'

class Pdf
    
  def append_to_file(file_name,file_entry)
    resume = PDF::Toolkit.open(file_name)
    resume_file_text = resume.to_text.read
    resume_file_text += file_entry
    resume = PDF::Writer.new()
    resume.text(resume_file_text)
    resume_file_stream = resume.render()
    File.open(file_name , "w") do |file|
      file.puts resume_file_stream
    end
  end
end
