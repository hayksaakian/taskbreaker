class Task
  include Mongoid::Document
  has_many :accomplishments
  field :name, :type => String
  field :goals, :type => Integer

  def self.when_to_run
    x = 0.5
    x = x * Delayed::Job.count
    x.seconds.from_now
  end

  def attempt_goals
  	remaining = self.goals - self.accomplishments.count
  	remaining.times do
  		self.attempt_goal
  	end
  	puts 'attempted goals'
  end

  def attempt_goal
  	counter = 0
  	arbitrary_number = 3
  	acc = self.accomplishments.new
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
  handle_asynchronously :attempt_goal, :run_at => Proc.new { when_to_run }

  def self.attempt_tasks
  	Task.find_each do |ts|
  		ts.delay.attempt_goals
  	end
  	puts 'attempted all tasks'
  end
end
#job flow
# 15 dealers
# 20 - 180 listings per dealer
# 2 extra jobs per listings