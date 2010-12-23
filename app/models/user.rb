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

class User < ActiveRecord::Base
  attr_accessible :name, :age, :address, :file_type, :resume_file_name

  file_type_regex = /pdf|txt/
  age_regex = /(\d)/

  validates :name, :presence => true,
  :length => {:maximum =>50}

  validates :age, :presence =>true,
  :format => {:with =>age_regex}

  validates :address, :presence => true

  validates :file_type, :presence =>true,
  :format => {:with => file_type_regex}

end
