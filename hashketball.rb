# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def home
  game_hash[:home][:players]
end

def away
  away = game_hash[:away][:players]
end

def num_points_scored(name)
  points = 0
  home.each do |player|
    if player[:player_name] == name
      points = player[:points]
    end
  end
  away.each do |player|
    if player[:player_name] == name
      points = player[:points]
    end
  end
  points
end

def shoe_size(name)
  shoe = 0
  home.each do |player|
    if player[:player_name] == name
      shoe = player[:shoe]
    end
  end
  away.each do |player|
    if player[:player_name] == name
      shoe = player[:shoe]
    end
  end
  shoe
end

def team_colors(name)
  if game_hash[:home][:team_name] == name
    game_hash[:home][:colors]
  else
    game_hash[:away][:colors]
  end
end

def team_names
  newArray = []
  newArray.push(game_hash[:home][:team_name])
  newArray.push(game_hash[:away][:team_name])
  newArray
end

def player_numbers(name)
  newArray = []
  if game_hash[:home][:team_name] == name
    home.each do |player|
      newArray.push(player[:number])
    end
  else
    away.each do |player|
      newArray.push(player[:number])
    end
  end
  newArray
end

def player_stats(name)
  stats = {}
  home.each do |player|
    if player[:player_name] == name
      player.each do |stat|
        stats[stat[0]] = stat[1]
      end
    end
  end
  away.each do |player|
    if player[:player_name] == name
      player.each do |stat|
        stats[stat[0]] = stat[1]
      end
    end
  end
  stats
end

def biggest
  biggest = 0
  home.each do |player|
    if player[:shoe] > biggest
      biggest = player[:shoe]
    end
  end
  away.each do |player|
    if player[:shoe] > biggest
      biggest = player[:shoe]
    end
  end
  biggest
end

def big_shoe_rebounds
  rebounds = 0
  home.each do |player|
    if player[:shoe] == biggest
      rebounds = player[:rebounds]
    end
  end
  away.each do |player|
    if player[:shoe] == biggest
      rebounds = player[:rebounds]
    end
  end
  rebounds
end

def most_points_scored
  points = 0
  home.each do |player|
    if player[:points] > points
      points = player[:points]
    end
  end
  away.each do |player|
    if player[:points] > points
      points = player[:points]
    end
  end
  puts points
end

def winning_team
  homeArray = []
  awayArray = []
  home.each do |player|
    homeArray.push(player[:points])
  end
  away.each do |player|
    away.push(player[:points])
  end
  homePoints = homeArray.sum
  awayPoints = awayArray.sum
  if homePoints > awayPoints
    puts game_hash[:home][:team_name]
  else
    puts game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longestName = ""
  size = 0
  home.each do |player|
    if player[:player_name].length > size
      size = player[:player_name].length
      longestName = player[:player_name]
    end
  end
  away.each do |player|
    if player[:player_name].length > size
      size = player[:player_name].length
      longestName = player[:player_name]
    end
  end
  longestName
end

def long_name_steals_a_ton?
  numSteals = 0
  home.each do |player|
    if player[:steals] > numSteals
      numSteals = player[:steals]
    end
  end
  away.each do |player|
    if player[:steals] > numSteals
      numSteals = player[:steals]
    end
  end
  puts numSteals
  puts player_stats(player_with_longest_name)
  if player_stats(player_with_longest_name)[:steals] == numSteals
    puts true
  else
    puts false
  end
end

most_points_scored
winning_team
player_with_longest_name
long_name_steals_a_ton?

