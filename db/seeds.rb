user = User.create!(first_name:'Jon', last_name: 'Snow', email: 'test@email.com', password: '123456', )
puts "1 user has been created"

admin_user = AdminUser.create!(first_name:'Admin', last_name: 'User', email: 'admin@email.com', password: '123456', )
puts "1 admin_user has been created"

10.times do |posts|
  Post.create!(date: Date.today, rationale: "#{posts}", user_id: user.id)
end
puts "100 posts have been created"
