#!/usr/bin/env ruby

# A simple Ruby script to generate weather using the Pathfinder weather table.
# http://www.d20pfsrd.com/gamemastering/environment/weather

WEATHER_TABLE = [["d%", "Weather", "Cold", "Temperate", "Desert"],
                 [1..70, "Normal weather", "Cold, calm", "Normal for season", "Hot, calm"],
                 [71..80, "Abnormal weather", "Heat wave (01-30) or cold snap (31-100)", "Heat wave (01-50) or cold snap (51-100)", "Hot, windy"],
                 [81..90, "Inclement weather", "Precipitation (snow)", "Precipitation (normal for season)", "Hot, windy"],
                 [91..99, "Storm", "Snow storm", "Thunderstorm, snowstorm", "Duststorm"],
                 [100, "Powerful storm", "Blizzard", "Windstorm, blizzard, hurricane, tornado", "Downpour"]]

MONTHS = ["Abadius", "Calistril", "Pharast", "Gozran", "Desnus", "Sarenith", "Erastus", "Arodus", "Rova", "Lamashan", "Neth", "Kuthona"]

FILENAME = "year_of_weather.txt"

climate = ARGV.shift.capitalize
climate_index = WEATHER_TABLE[0].index(climate)

File.open(FILENAME, "w") do |file|
  MONTHS.each do |month|
    file.puts(month)
    for i in 1..30
      roll = 1 + rand(100)
      for row in WEATHER_TABLE[1..(WEATHER_TABLE.length - 1)]
        file.puts([i, row[1], row[climate_index]].join(", ")) if row[0] === roll
      end
    end
    file.puts("\n")
  end
end     
