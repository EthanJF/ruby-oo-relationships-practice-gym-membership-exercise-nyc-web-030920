class Membership
  attr_reader :cost, :gym, :lifter #added gym and lifter as attr_readers
  
  @@all = []

  def initialize(cost, gym, lifter) #added gym and lifter as arguments to initialize
    @cost = cost
    @gym = gym
    @lifter = lifter
    Membership.all << self
  end
  
  def self.all #list of all memberships
    @@all
  end
  
end
