@users = User.all
@users.each do |user|
  user.create_profile! if user.profile.nil?
end
