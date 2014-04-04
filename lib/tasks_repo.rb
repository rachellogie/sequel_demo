require 'sequel'

class TasksRepo

  def initialize
    @db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
  end

  def create(attributes)
    @db.create_table! :tasks do
      primary_key :id
      String :description
      Boolean :completed, default: false
    end
    tasks = @db[:tasks]
    tasks.insert(attributes)
  end

  def all
    tasks = @db[:tasks]
    tasks.to_a
  end

  def update(id, attributes)
    @db[:tasks].where('id = ?', id).update(attributes)
  end

end

