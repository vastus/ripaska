require_relative 'mappery'

class Post < Mappery

  def initialize(data)
    @data = data
  end

  def self.all
    data = Sohva.find_all(:posts, :published)
    data.map {|d| new(d) }
  end

  def self.find(prop, value)
    data = Sohva.find_one(:posts, prop, value)
    new(data)
  end

end

