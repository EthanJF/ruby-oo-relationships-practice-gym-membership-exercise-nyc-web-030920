class Lifter
  attr_reader :name, :lift_total
  
  @@all = []

  def initialize(name, lift_total)
    @name = name
    @lift_total = lift_total
    Lifter.all << self
  end
  
  def self.all #list of all lifters
    @@all
  end
  
  def memberships # list of all the memberships that a specific lifter has
    Membership.all.select{|membership| membership.lifter == self}
  end
  
  def gyms #list of all the gyms that a specific lifter has memberships to
    memberships.map{|membership| membership.gym}
  end
  
  def self.average_lift_total #the average lift total of all lifters
    total = Lifter.all.map{|lifter| lifter.lift_total}.sum
    total / Lifter.all.size
  end
  
  def total_cost # total cost of a specific lifter's gym memberships
    memberships.map{|membership| membership.cost}.sum
  end
  
  def new_gym(cost, gym) #Given a gym and a membership cost, sign a specific lifter up for a new gym
    Membership.new(cost, gym, self)
  end
  
  
end
