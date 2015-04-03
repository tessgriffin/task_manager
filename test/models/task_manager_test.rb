require_relative '../test_helper'


class TaskManagerTest < Minitest::Test
  def create_tasks(num)
    num.times do |x|
      TaskManager.create({ title: "my task#{x}",
                           description: "something#{x}"})
    end
  end

  def test_can_create_a_task_with_an_id
    #pass a title and description to taskmanager#create
    task = TaskManager.create({ title: "my task", description: "something"})
    #find the task with an id of 1
    #found_task = TaskManager.find(task.id)
    test_task = TaskManager.all.last

    assert_equal "my task", test_task.title
    assert_equal "something", test_task.description
  end

  def test_it_can_find_all_tasks
    create_tasks(5)
    tasks = TaskManager.all

    assert_equal 5, tasks.count
  end

  def test_it_can_find_a_task
    task1 = TaskManager.create({ title: "my task1", description: "something1"})
    task2 = TaskManager.create({ title: "my task2", description: "something2"})
    task3 = TaskManager.create({ title: "my task3", description: "something3"})
    task4 = TaskManager.create({ title: "my task4", description: "something4"})

    test_id = TaskManager.all.last.id
    last_task = TaskManager.find(test_id)

    assert_equal "my task4", last_task.title
    assert_equal "something4", last_task.description
  end

  def test_it_can_update_a_task
    task1 = TaskManager.create({ title: "my task1", description: "something1"})
    # task = TaskManager.find(4)
    test_id = TaskManager.all.last.id
    TaskManager.update(test_id, {title: "boo", description: "state"})
    # task_new = TaskManager.find(4)
    updated_task = TaskManager.all.last
    assert_equal "boo", updated_task.title
  end

  def test_it_can_delete_a_task
    create_tasks(10)
    assert_equal 10, TaskManager.all.count
    
    delete_task_id = TaskManager.all.last.id
    TaskManager.delete(delete_task_id)
    tasks = TaskManager.all

    assert_equal 9, tasks.count
  end
end