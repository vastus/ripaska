require_relative 'sohva'

class Mappery < Sohva

  def get(prop)
    return @data[prop.to_s]
  end

end

