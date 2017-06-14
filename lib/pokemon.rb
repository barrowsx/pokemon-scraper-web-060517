require 'pry'
class Pokemon

  def initialize(id)
    @id = id
  end

  def id
    @id[:id]
  end

  def name
    @id[:name]
  end

  def type
    @id[:type]
  end

  def db
    @id[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id_num, db)
    temp = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id_num).flatten
    Pokemon.new({id: temp[0], name: temp[1], type: temp[2], db: db})
  end

end
