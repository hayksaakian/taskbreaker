class Accomplishment
  include Mongoid::Document
  belongs_to :task
  field :arbitrary_array, :type => Array
end
