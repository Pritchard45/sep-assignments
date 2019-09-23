# DEF nearest_possible_neighbor(current_city)
#   SET neighbor_cities TO current_city.neighbors
#   SET nearest_neighbor TO first element in neighbor_cities
#
#   FOR current_neighbor IN neighbor_cities
#     IF current_neighbor.visited IS FALSE AND current_neighbor.distance < nearest_neighbor.distance
#       ASSIGN nearest_neighbor TO current_neighbor
#     END IF
#   END FOR
#   RETURN nearest_neighbor
# END DEF

class City
  attr_accessor :name
  attr_accessor :coord1
  attr_accessor :coord2

  def initialize(name, coord1, coord2)
    @name = name
    @coord1 = coord1
    @coord2 = coord2
  end
end

  def travel(city1, city2)
    puts "City 1: #{city1.name}, #{city1.coord1}, #{city1.coord2}"
    puts "City 2: #{city2.name}, #{city2.coord1}, #{city2.coord2}"
    Math.hypot(city2.coord1 - city1.coord1, city2.coord2 - city1.coord2)
  end

  def nearest_neighbor(all_cities, current_city)
    temp = [current_city.name]
    puts "This city is #{temp}"
    until all_cities[0].nil?
      next_city = all_cities[-1]
      all_cities.each do |route|
        puts "This is distance 1: #{travel(current_city, next_city)}"
        puts "This is distance 2: #{travel(current_city, route)}"
        if travel(current_city, next_city) > travel(current_city, route)
          next_city = route
        end
      end
      current_city =  next_city
      all_cities.delete(next_city)
      temp.push(current_city.name)
    end
    temp
  end

  home = City.new("alpine", 0, 0)
  city1 = City.new("philly", 3, 7)
  city2 = City.new("miami", 67, 10)
  city3 = City.new("denver", 4, 5)
  city4 = City.new("chicago", 10, 7)
  graph = [city1, city2, city3, city4]
  trip = nearest_neighbor(graph, home)
  puts trip
