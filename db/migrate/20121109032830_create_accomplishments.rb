class CreateAccomplishments < ActiveRecord::Migration
  def up
    create_table :accomplishments do |t|
      t.text :arbitrary_array
      t.text :arbitrary_string
      t.references :task
    end
  end
end
