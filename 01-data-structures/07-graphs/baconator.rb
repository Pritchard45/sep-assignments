require_relative 'node'

class Baconator
  def find_kevin_bacon(start)
    queue = []
    found = false
    queue.push(start)
    while(queue.size != 0)
      count = queue.size
        if count > 6
          return count
        end
      node = queue.shift
      node.film_actor_hash.each do |movie, actor_nodes|


        if !start.path_array.include?(movie)
          start.path_array.push(movie)
        end
        actor_nodes.each do |actor|
          if actor.name != "Kevin Bacon" && actor.visited == false
            if actor.path_array.size == 1 && actor.name != "Kevin Bacon"
              actor.visited = true
            end
            queue.push(actor)
            actor.visited = true
          end
          #baconator found
          if actor.name == "Kevin Bacon"
            found = true
            return start.path_array
          end
        end
      end
    end
    return "Connection not found to Baconator"
  end

  def reset(hash)
    hash.each do |movie, actor_nodes|
      actor_nodes.each do |actor|
        actor.visited = false
      end
    end
  end
end
