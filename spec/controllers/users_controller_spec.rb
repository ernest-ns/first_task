require 'spec_helper'

describe UsersController do
  render_views

  describe "GET 'new'" do
    it "should be successful" do
      get 'new'
      response.should be_success
    end

    it "should have the right title" do
      get 'new'
      response.should have_selector("title", :content => "Create Resume")
    end
  end

  describe "GET show" do
    before(:each) do
      @user = Factory(:user)
    end

    it "should be successful" do
      get :show, :id => @user
      response.should be_success
    end

    it "should find the right user" do
      get :show, :id => @user
      assigns(:user).should == @user
    end

    it "should have the right title" do
      get :show, :id =>@user
      response.should have_selector("title", :content => @user.name)
    end
  end

  describe "POST Create" do
    describe "failure" do
      before(:each) do
        @attr = { :name =>"", :age => "", :address => "", :file_type => "", :resume_file_name => "" }
      end

      it "should not create a user " do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "should have the right title" do
        post :create, :user => @attr
          response.should have_selector("title", :content => "")
      end

      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
    end

    describe "success" do
      before(:each) do
        @attr = { :name => "sample", :age => "34", :address =>"blore",  :file_type =>"pdf", :resume_file_name => "sample.pdf" }
      end

      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end    
    end
  end

end
