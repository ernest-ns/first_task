require 'spec_helper'

describe "Users" do
  describe "create resume" do
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit createresume_path
          fill_in "Name",         :with => ""
          fill_in "Age",        :with => ""
          fill_in "Address",     :with => ""
          fill_in "File Type", :with => ""
          click_button
          response.should render_template('users/new')
          response.should have_selector("div#error_explanation")
        end.should_not change(User, :count)
      end
    end
    describe "failure" do
      it "should not make a new user" do
        lambda do
          visit createresume_path
          fill_in "Name",         :with => "Sample"
          fill_in "Age",        :with => "23"
          fill_in "Address",     :with => "blore"
          fill_in "File Type", :with => "pdf"
          click_button
          response.should render_template('users/show')
        end.should change(User, :count).by(1)
      end
    end

  end
end
