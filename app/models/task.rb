class Task
  include Mongoid::Document
  include Mongoid::Locker
  has_many :accomplishments
  field :name, :type => String
  field :goals, :type => Integer

  def attempt_goals
  	remaining = self.goals - self.accomplishments.count
  	remaining.times do
  		self.delay.attempt_goal
  	end
  	puts 'attempted goals'
  end

  def attempt_goal
  	counter = 0
  	arbitrary_number = 5
  	acc = self.accomplishments.create!
  	acc.arbitrary_array = []
  	arbitrary_number.times do 
  		acc.attempt_array
  	end
  	arbitrary_number.times do 
  		acc.attempt_string
  	end
  	acc.save
  	puts 'attempted a goal'
  end

  def self.attempt_tasks
  	Task.all.each do |ts|
  		ts.delay.attempt_goals
  	end
  	puts 'attempted all tasks'
  end
end
#job flow
# 15 dealers
# 20 - 180 listings per dealer
# 2 extra jobs per listings
