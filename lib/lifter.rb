class Lifter
  attr_reader :name, :lift_total
  
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    Lifter.all << self
  end
  
  def self.all
    @@all
  end
  
  def memberships
    Membership.all.select{|membership| membership.lifter == self}
  end
  
  def gyms
    memberships.map{|membership| membership.gym}
  end
  
  def self.average_lift_total
    total = Lifter.all.map{|lifter| lifter.lift_total}.sum
    total / Lifter.all.size
  end
  
  def total_cost
    memberships.map{|membership| membership.cost}.sum
  end
  
  def new_gym(cost, gym)
    Membership.new(cost, gym, self)
  end
  
  
end
