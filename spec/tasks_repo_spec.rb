require 'tasks_repo'

describe TasksRepo do

  it "can create tasks" do
    repo = TasksRepo.new
    description = "Do #{rand(2..20)} stuff"
    repo.create(description: description)
    tasks = repo.all
    expect(tasks).to eq(
      [
        {id: 1, description: description, completed: false}
      ]
    )
  end

  it "updates the attributes of an item" do
    repo = TasksRepo.new
    id = repo.create(description: "hello")
    repo.update(id, description: "bye", completed: true)
    tasks = repo.all
    expect(tasks).to eq(
      [
        {id: 1, description: "bye", completed: true}
      ]
    )
  end


end