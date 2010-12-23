require 'spec_helper'

describe User do


  before(:each) do
    @attr = {:name =>"Example User", :age => "22", :address => "blore", :file_type =>"txt", :resume_file_name => "Example_User.txt"}
  end

  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge(:name => ""))
    no_name_user.should_not be_valid
  end

  it "should require an age" do
    no_age_user = User.new(@attr.merge(:age => ""))
    no_age_user.should_not be_valid
  end

  it "should require an address" do
    no_address_user = User.new(@attr.merge(:address => ""))
    no_address_user.should_not be_valid
  end

  it "should require a file type" do
    no_file_type_user = User.new(@attr.merge(:file_type => ""))
    no_file_type_user.should_not be_valid
  end

  it "should reject names that are too long" do
    long_name = "a" * 51
    long_name_user = User.new(@attr.merge(:name => long_name))
    long_name_user.should_not be_valid
  end

  it "should accept only txt or pdf" do
    file_types = %w[txt pdf]
    file_types.each do |type|
      valid_file_type_user = User.new(@attr.merge(:file_type => type))
      valid_file_type_user.should be_valid
    end
  end

  it "should reject invalid file types" do
    file_types = %w[doc 123 text]
    file_types.each do |type|
      valid_file_type_user = User.new(@attr.merge(:file_type => type))
      valid_file_type_user.should_not be_valid
    end
  end
  

end


