class Gym
  attr_reader :name
  
  @@all = []

  def initialize(name)
    @name = name
    Gym.all << self
  end
  
  def self.all #list of all gyms
    @@all
  end
  
  def memberships #list of all memberships at a specific gym
    Membership.all.select{|membership| membership.gym == self}
  end
  
  def lifters #list of all the lifters that have a membership to a specific gym
    memberships.map{|membership| membership.lifter}
  end
  
  def lifter_names #list of the names of all lifters that have a membership to that gym
    lifters.map{|lifter| lifter.name}
  end
  
  def lift_total_all_lifters #the combined lift total of every lifter has a membership to that gym
    lifters.map{|lifter| lifter.lift_total}.sum
  end
  
  
end
