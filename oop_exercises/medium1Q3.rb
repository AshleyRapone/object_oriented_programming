class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  def inititalize(name, year, parking)
    super(name, year)
    @parking =  parking
  end
end

class Undergraduate < Student
  def inititalize(name, year)
    super
  end 
end
