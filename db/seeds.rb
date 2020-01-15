100.times do |posts|
  Post.create!(date: Date.today, rationale: "#{posts}")
end

puts "100 posts have been created"
