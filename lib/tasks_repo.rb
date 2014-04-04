require 'sequel'

class TasksRepo
  def create(task)
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')

    db.create_table! :tasks do
      primary_key :id
      String :description
      Boolean :completed, default: false
    end

    tasks = db[:tasks]

    tasks.insert(task)

  end

  def all
    db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')
    tasks = db[:tasks]
    tasks.to_a
  end
end