module UsersHelper
  def download_file(user)
    file_name = user.resume_file_name
    link_to "Download1" , "#{root_url}#{user.name}.#{user.file_type}"
  end
end
