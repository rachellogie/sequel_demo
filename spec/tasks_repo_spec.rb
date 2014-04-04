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
end