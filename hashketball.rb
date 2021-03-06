require 'pry'

def game_hash 
  hash = {
  :home => {
    :team_name => ("Brooklyn Nets"),
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
          :number => (0),
          :shoe => (16),
          :points => (22),
          :rebounds => (12),
          :assists => (12),
          :steals => (3),
          :blocks => (1),
          :slam_dunks => (1)
       },
       "Reggie Evans" => {
          :number => (30),
          :shoe => (14),
          :points => (12),
          :rebounds => (12),
          :assists => (12),
          :steals => (12),
          :blocks => (12),
          :slam_dunks => (7)
       },
       "Brook Lopez" => {
          :number => (11),
          :shoe => (17),
          :points => (17),
          :rebounds => (19),
          :assists => (10),
          :steals => (3),
          :blocks => (1),
          :slam_dunks => (15)
       },
       "Mason Plumlee" => {
          :number  => (1),
          :shoe     => (19),
          :points   => (26),
          :rebounds => (12),
          :assists  => (6),
          :steals   => (3),
          :blocks   => (8),
          :slam_dunks => (5)
       },
       "Jason Terry" => {
          :number => (31),
          :shoe => (15),
          :points => (19),
          :rebounds => (2),
          :assists => (2),
          :steals => (4),
          :blocks => (11),
          :slam_dunks => (1)
       }
    },
  },
  :away => {
    :team_name => ("Charlotte Hornets"),
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
          :number => (4),
          :shoe => (18),
          :points => (10),
          :rebounds => (1),
          :assists => (1),
          :steals => (2),
          :blocks => (7),
          :slam_dunks => (2)
       },
       "Bismak Biyombo" => {
          :number => (0),
          :shoe => (16),
          :points => (12),
          :rebounds => (4),
          :assists => (7),
          :steals => (7),
          :blocks => (15),
          :slam_dunks => (10)
       },
       "DeSagna Diop" => {
          :number => (2),
          :shoe => (14),
          :points => (24),
          :rebounds => (12),
          :assists => (12),
          :steals => (4),
          :blocks => (5),
          :slam_dunks => (5)
       },
       "Ben Gordon" => {
          :number => (8),
          :shoe => (15),
          :points => (33),
          :rebounds => (3),
          :assists => (2),
          :steals => (1),
          :blocks => (1),
          :slam_dunks => (0)
       },
       "Brendan Haywood" => {
          :number => (33),
          :shoe => (15),
          :points => (6),
          :rebounds => (12),
          :assists => (12),
          :steals => (22),
          :blocks => (5),
          :slam_dunks => (12)
       }
    }
  }
}

hash
end

def num_points_scored(player)
  points = ()
  game_hash.each do |side, team_info|
    team_info.each do |info_types, info|
      if info.include? (player)
        info.each do |players, categories|
          if players == player
          points = categories.values_at(:points).join(" ").to_i
          return points
          end
        end
      end  
    end  
  end   
end  
  
def shoe_size(player)
  points = ()
  game_hash.each do |side, team_info|
    team_info.each do |info_types, info|
      if info.include? (player)
        info.each do |players, categories|
          if players == player
          shoe = categories.values_at(:shoe).join(" ").to_i
          return shoe
          end
        end
      end  
    end  
  end   
end    

def team_colors(team)
  
  game_hash.each do |side, team_info|
    team_info.each do |info_types, info|
      if info.include? (team)
        colors = team_info.values_at(:colors).flatten
        return colors
      end
    end      
  end  
end

def team_names
  teams = []
  game_hash.each do |side, team_info|
    teams << team_info.fetch_values(:team_name)
  end
   teams.flatten!
 
end  
      
def player_numbers(team) 
  numbers = []
  game_hash.each do |side, team_info|
    
    team_info.each do |info_types, info|
      if team_info.values_at(:team_name).to_s.slice(2..-3) == team
        if info_types == :players
        info.each do |players, categories|
          
          numbers << categories.fetch_values(:number)
        end
        return numbers.flatten!
       end
     end
   
    end   
  end
 
end  
      

def player_stats(player_name)
  stats=[]
  game_hash.each do |side, team_info|
    team_info.each do |info_types, info|
      if info.include?(player_name)
       if info_types == :players
      
        stats = info[player_name]
      end
      return stats
      end  
    end
  end      
end      

def big_shoe_rebounds
  shoe_size = []
  largest = ()
  game_hash.each do |side, team_info|
    team_info.each do |info_types, info|
      if info_types == :players
        info.each do |players, categories|
          shoe_size << categories[:shoe]
        end
      end
    end
  end
  largest = shoe_size.sort.last 
  
  game_hash.each do |side, team_info|
    team_info.each do |info_types, info|
      if info_types == :players
        info.each do |players, categories|
            if categories[:shoe] == largest 
            return  categories[:rebounds]
          end  
        end
      end
    end
  end  
end  
      
 
