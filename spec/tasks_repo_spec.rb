require 'tasks_repo'

describe TasksRepo do

  db = Sequel.connect('postgres://gschool_user:password@localhost:5432/tasks_test')

  before :each do
    db.create_table! :tasks do
      primary_key :id
      String :description
      Boolean :completed, default: false
    end
    @repo = TasksRepo.new(db)
  end

  it "can create tasks" do
    description = "Do #{rand(2..20)} stuff"
    @repo.create(description: description)
    tasks = @repo.all
    expect(tasks).to eq(
      [
        {id: 1, description: description, completed: false}
      ]
    )
  end

  it "updates the attributes of an item" do
    id = @repo.create(description: "hello")
    @repo.update(id, description: "bye", completed: true)
    tasks = @repo.all
    expect(tasks).to eq(
      [
        {id: 1, description: "bye", completed: true}
      ]
    )
  end

  it "finds an item by id" do
    @repo.create(description: "hello")
    id = @repo.create(description: "pet the cat")
    expected = @repo.find(id)
    actual = {id: 2, description: "pet the cat", completed: false}
    expect(actual).to eq expected
  end

  it "allows the user to delete an item" do
    @repo.create(description: "hello")
    @repo.create(description: "pet the cat")
    @repo.delete(2)
    actual = @repo.all
    expected = [{id: 1, description: "hello", completed: false}]
    expect(actual).to eq expected
  end

end