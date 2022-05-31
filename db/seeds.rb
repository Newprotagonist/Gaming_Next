require 'json'

puts "Destroying all games..."
Game.destroy_all
puts "Games destroyed"

puts "Parsing games seed..."
games = JSON.parse(File.read(File.join(__dir__, "seeds/some_games.json")))
puts "Creating games..."
games.each do |game|
  Game.create(
    name: game["name"],
    summary: game["summary"],
    screenshots: game["screenshots"]&.map { |s| s["url"]&.prepend("https:")&.sub("t_thumb", "t_1080p") },
    videos: game["videos"]&.map { |v| "https://youtu.be/#{v['video_id']}" },
    cover: game["cover"] ? game["cover"]["url"]&.prepend("https:")&.sub("t_thumb", "t_1080p") : nil,
    platforms: game["platforms"]&.map { |p| p["name"] },
    tags: game["tags"],
    rating: game["aggregated_rating"]
  )
end
puts "Done"
