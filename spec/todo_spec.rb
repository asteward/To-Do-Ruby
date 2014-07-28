require 'rspec'
require 'Lists.rb'
require 'tasks.rb'

describe Task do
  it 'is initialized with a description' do
    test_task = Task.new("x and y")
    expect(test_task).to be_an_instance_of Task
  end

  it 'lets you read the description' do
    test_task = Task.new('say hello')
    expect(test_task.description).to eq 'say hello'
  end
end

describe List do
  it 'is initialized with a description' do
    test_list = List.new("chores")
    expect(test_list).to be_an_instance_of List
  end

  it 'lets you read the name of the list' do
    test_list = List.new('chores')
    expect(test_list.description).to eq 'chores'
  end

  it 'adds a task to the task array' do
  test_list = List.new('clean')
  expect(test_list.add_task('clean')).to be_an_instance_of Task
 end
end
