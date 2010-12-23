# == Schema Information
# Schema version: 20101223053837
#
# Table name: users
#
#  id               :integer         not null, primary key
#  name             :string(255)
#  age              :integer
#  address          :string(255)
#  file_type        :string(255)
#  resume_file_name :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#
require 'document_creator.rb'
#require 'ruby_task_pdf.rb'
require 'ruby_task_txt.rb'

class User < ActiveRecord::Base
  attr_accessor :resume_file_name
  attr_accessible :name, :age, :address, :file_type

  file_type_regex = /pdf|txt/
  age_regex = /(\d)/

  validates :name, :presence => true,
  :length => {:maximum =>50}

  validates :age, :presence =>true,
  :format => {:with => age_regex}

  validates :address, :presence => true

  validates :file_type, :presence =>true,
  :format => {:with => file_type_regex}

  before_save :create_resume

  private

  def set_file_name
    self.resume_file_name = self.name.split.join("_")+"."+self.file_type
  end
  def create_resume
    set_file_name
    
    file_entry = "#{self.name},#{self.age},#{self.address}"
    file_obj = DocumentCreator.create_document(self.file_type)
    file_obj.append_to_file(self.resume_file_name,file_entry)
  end


end
