class Accomplishment
  include Mongoid::Document
  belongs_to :task
  field :arbitrary_array, :type => Array
  field :arbitrary_string, :type => String
  def attempt_array
  	self.arbitrary_array.push(self.arbitrary_array.length)
  	self.save
  	puts 'attempted a string'
  end
  def attempt_string
  	number = self.arbitrary_string.to_i
  	number += 1
  	self.arbitrary_string = number.to_s
  	self.save
  	puts 'attempted a string'
  end
end
