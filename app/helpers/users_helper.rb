module UsersHelper
  def download_file(user)
    file_name = user.resume_file_name
    link_to "Download1" , "#{root_url}sample7.txt"
  end
end
