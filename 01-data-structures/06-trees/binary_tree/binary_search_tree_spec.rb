include RSpec

require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("Guardians of the Galaxy", 87) }
  # these are not accurate scores as majority of these movies have the same score.
  let (:tree) { BinarySearchTree.new(root) }
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
    it "properly inserts a new node as a left child" do
      tree.insert(root, thor_2)
      expect(root.left.title).to eq "Thor: The Dark World"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(root, ultron)
      tree.insert(root, thor_2)
      expect(root.left.left.title).to eq "Thor: The Dark World"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(root, doctor)
      tree.insert(root, spider_man)
      expect(root.left.right.title).to eq "Spider-Man: Far From Home"
    end

    it "properly inserts a new node as a right child" do
      tree.insert(root, cap_america)
      expect(root.right.title).to eq "Captain America: Civil War"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(root, iron_man)
      tree.insert(root, thor_3)
      expect(root.right.left.title).to eq "Thor: Ragnarok"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(root, endgame)
      tree.insert(root, black_panther)
      expect(root.right.right.title).to eq "Black Panther"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(root, endgame)
      tree.insert(root, black_panther)
      expect(tree.find(root, nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(root, thor_2)
      expect(tree.find(root, thor_2.title).title).to eq "Thor: The Dark World"
    end

    it "properly finds a left-left node" do
      tree.insert(root, ultron)
      tree.insert(root, thor_2)
      expect(tree.find(root, thor_2.title).title).to eq "Thor: The Dark World"
    end

    it "properly finds a left-right node" do
      tree.insert(root, doctor)
      tree.insert(root, spider_man)
      expect(tree.find(root, spider_man.title).title).to eq "Spider-Man: Far From Home"
    end

    it "properly finds a right node" do
      tree.insert(root, cap_america)
      expect(tree.find(root, cap_america.title).title).to eq "Captain America: Civil War"
    end

    it "properly finds a right-left node" do
      tree.insert(root, iron_man)
      tree.insert(root, thor_3)
      expect(tree.find(root, thor_3.title).title).to eq "Thor: Ragnarok"
    end

    it "properly finds a right-right node" do
      tree.insert(root, endgame)
      tree.insert(root, black_panther)
      expect(tree.find(root, black_panther.title).title).to eq "Black Panther"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete(root, nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert(root, iron_man)
      tree.delete(root, iron_man.title)
      expect(tree.find(root, iron_man.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert(root, ultron)
      tree.insert(root, thor_2)
      tree.delete(root, thor_2.title)
      expect(tree.find(root, thor_2.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert(root, doctor)
      tree.insert(root, spider_man)
      tree.delete(root, spider_man.title)
      expect(tree.find(root, spider_man.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert(root, cap_america)
      tree.delete(root, cap_america.title)
      expect(tree.find(root, cap_america.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert(root, iron_man)
      tree.insert(root, thor_3)
      tree.delete(root, thor_3.title)
      expect(tree.find(root, thor_3.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert(root, endgame)
      tree.insert(root, black_panther)
      tree.delete(root, black_panther.title)
      expect(tree.find(root, black_panther.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Guardians of the Galaxy: 87\nAnt-Man: 80\nIron Man: 93\nThor: The Dark World: 72\nSpider-Man: Far From Home: 86\nThor: Ragnarok: 92\nAvengers: Endgame: 94\nAvengers: Age of Ultron: 78\nThe Avengers: 91\nBlack Panther: 98\nCaptain America: Civil War: 90\n"
       tree.insert(root, iron_man)
       tree.insert(root, endgame)
       tree.insert(root, ant_man)
       tree.insert(root, thor_3)
       tree.insert(root, thor_2)
       tree.insert(root, spider_man)
       tree.insert(root, ultron)
       tree.insert(root, avengers)
       tree.insert(root, cap_america)
       tree.insert(root, black_panther)
       expect { tree.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Guardians of the Galaxy: 87\nAvengers: Age of Ultron: 78\nBlack Panther: 98\nThor: The Dark World: 72\nSpider-Man: Far From Home: 86\nCaptain America: Civil War: 90\nAnt-Man: 80\nThe Avengers: 91\nThor: Ragnarok: 92\nAvengers: Endgame: 94\nIron Man: 93\n"
       tree.insert(root, black_panther)
       tree.insert(root, cap_america)
       tree.insert(root, avengers)
       tree.insert(root, ultron)
       tree.insert(root, spider_man)
       tree.insert(root, thor_2)
       tree.insert(root, thor_3)
       tree.insert(root, ant_man)
       tree.insert(root, endgame)
       tree.insert(root, iron_man)
       expect { tree.printf }.to output(expected_output).to_stdout
     }
  end
end
