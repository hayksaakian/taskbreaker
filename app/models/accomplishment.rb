class Accomplishment
  include Mongoid::Document
  include Mongoid::Locker
  belongs_to :task
  # serialize :arbitrary_array, Array
  field :arbitrary_array, :type => Array
  field :arbitrary_string, :type => String

  def self.when_to_run
    x = 0.04
    x = x * Delayed::Job.count
    x.seconds.from_now
  end

  def attempt_array
    self.with_lock({:wait => true, :timeout => 60}) do
      self.push(:arbitrary_array, self.arbitrary_array.length)
      # self.save
      puts 'attempted a string'
    end
  end
  handle_asynchronously :attempt_array, :run_at => Proc.new { when_to_run }

  def attempt_string
    self.with_lock({:wait => true, :timeout => 60}) do
      number = self.arbitrary_string.to_i
      number += 1
      self.set(:arbitrary_string, number.to_s)
      # self.save
      puts 'attempted a string'
    end
  end
  handle_asynchronously :attempt_string, :run_at => Proc.new { when_to_run }
end
