require 'json'

puts "Destroying all games..."
Game.destroy_all
puts "Games destroyed"
files = Dir.children(File.join(__dir__, "seeds/data")).sort_by { |f| f[/\d+/].to_i }
n = 0
start = Time.now
files.each do |file|
  # print "\rParsing file: #{file}"
  games = JSON.parse(File.read(File.join(__dir__, "seeds/data/#{file}")))
  print "\rCreating games: #{n} - #{file[/177/] ? n + 357 : n + 500}"
  n += 500
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
end
puts "\nDone in #{Time.now - start}s"
