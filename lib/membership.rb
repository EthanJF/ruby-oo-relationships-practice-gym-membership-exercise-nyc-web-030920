class Membership
  attr_reader :cost
  
  @@all = []

  def initialize(cost, gym, lifter)
    @cost = cost
    @gym = gym
    @lifter = lifter
    Membership.all << self
  end
  
  def self.all
    @@all
  end
  
end
