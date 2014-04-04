require 'sequel'

class TasksRepo

  def initialize(db)
    @db = db
  end

  def create(attributes)
    @db[:tasks].insert(attributes)
  end

  def all
    @db[:tasks].to_a
  end

  def update(id, attributes)
    @db[:tasks].where('id = ?', id).update(attributes)
  end

  def find(id)
    @db[:tasks].where('id = ?', id).to_a.first
  end

  def delete(id)
    @db[:tasks].where('id = ?', id).delete
  end

end

