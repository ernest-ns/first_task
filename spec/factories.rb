# By using the symbol ':user', we get Factory Girl to simulate the User model.
Factory.define :user do |user|
  user.name                  "Michael"
  user.age                 "30"
  user.address             "Dharwad"
  user.file_type              "pdf"
  user.resume_file_name             "Michael.pdf"
end
