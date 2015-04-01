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
    create_tasks(1)
    #find the task with an id of 1
    task = TaskManager.find(1)

    assert_equal "my task0", task.title
    assert_equal "something0", task.description
  end

  def test_it_can_find_all_tasks
    create_tasks(5)
    tasks = TaskManager.all

    assert_equal 5, tasks.count
  end

  def test_it_can_find_a_task
    create_tasks(10)
    task = TaskManager.find(5)

    assert_equal "my task4", task.title
    assert_equal "something4", task.description
  end

  def test_it_can_update_a_task
    create_tasks(5)
    task = TaskManager.find(4)

    TaskManager.update(4, {title: "boo", description: "state"})
    task_new = TaskManager.find(4)

    assert_equal "boo", task_new.title
  end

  def test_it_can_delete_a_task
    create_tasks(10)
    TaskManager.delete(3)
    tasks = TaskManager.all

    assert_equal 9, tasks.count
  end
end