class Task
  include Mongoid::Document
  has_many :accomplishments
  field :name, :type => String
  field :goals, :type => Integer
  def attempt_goals
  	self.goals.times do
  		self.attempt_goal
  	end
  	puts 'attempted goals'
  end
  def attempt_goal
  	counter = 0
  	arbitrary_number = 200
  	acc = self.accomplishments.new
  	acc.arbitrary_array = []
  	arbitrary_number.times do 
  		acc.arbitrary_array.push(Random.rand(arbitrary_number))
  	end
  	acc.save
  	puts 'attempted a goal'
  end
  def self.attempt_tasks
  	Task.all.each do |ts|
  		ts.attempt_goals
  	end
  	puts 'attempted all tasks'
  end
end
#job flow
# 15 dealers
# 20 - 180 listings per dealer
# 2 extra jobs per listings