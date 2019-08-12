include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("Guardians of the Galaxy", 87) }
  # these are not accurate scores as majority of these movies have the same score.
  let (:tree) { MinBinaryHeap.new(root) }
  let (:thor_2) { Node.new("Thor: The Dark World", 72) }
  let (:ultron) { Node.new("Avengers: Age of Ultron", 78) }
  let (:ant_man) { Node.new("Ant-Man", 80) }
  let (:doctor) { Node.new("Dr. Strange", 85) }
  let (:spider_man) { Node.new("Spider-Man: Far From Home", 86) }
  let (:cap_america) { Node.new("Captain America: Civil War", 90) }
  let (:avengers) { Node.new("The Avengers", 91) }
  let (:thor_3) { Node.new("Thor: Ragnarok", 92) }
  let (:iron_man) { Node.new("Iron Man", 93) }
  let (:endgame) { Node.new("Avengers: Endgame", 94) }
  let (:black_panther) { Node.new("Black Panther", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, thor_2)
      expect(tree.root.title).to eq "Thor: The Dark World"
    end

    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, thor_2)
      expect(tree.root.left.title).to eq "Guardians of the Galaxy"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, ultron)
      tree.insert(tree.root, thor_2)
      expect(tree.root.left.left.title).to eq "Guardians of the Galaxy"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(tree.root, doctor)
      tree.insert(tree.root, spider_man)
      expect(tree.root.right.title).to eq "Spider-Man: Far From Home"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(tree.root, thor_2)
      tree.insert(tree.root, cap_america)
      expect(tree.root.right.title).to eq "Captain America: Civil War"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(tree.root, thor_2)
      tree.insert(tree.root, cap_america)
      tree.insert(tree.root, iron_man)
      tree.insert(tree.root, thor_3)
      tree.insert(tree.root, black_panther)
      expect(tree.root.right.left.title).to eq "Black Panther"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(tree.root, thor_2)
      tree.insert(tree.root, cap_america)
      tree.insert(tree.root, iron_man)
      tree.insert(tree.root, thor_3)
      tree.insert(tree.root, black_panther)
      tree.insert(tree.root, endgame)
      expect(tree.root.right.right.title).to eq "Avengers: Endgame"
    end
  end

  describe "#print" do
    it "should print" do
      tree.insert(tree.root, thor_2)
      tree.insert(tree.root, cap_america)
      tree.insert(tree.root, iron_man)
      tree.insert(tree.root, thor_3)
      tree.insert(tree.root, black_panther)
      tree.insert(tree.root, endgame)
      tree.printf()
    end
  end
end
