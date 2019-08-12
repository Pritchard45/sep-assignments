class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :left
  attr_accessor :right

  def initialize(title, rating)
    @title, @rating = title, rating
    left = nil
    right = nil
  end
end
