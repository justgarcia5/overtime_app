user = User.create!(first_name:'Test', last_name: 'Testing', email: 'test@email.com', password: '123456', )
puts "1 user has been created"

100.times do |posts|
  Post.create!(date: Date.today, rationale: "#{posts}", user_id: user.id)
end
puts "100 posts have been created"
