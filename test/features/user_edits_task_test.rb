require_relative "../test_helper"

class EditTaskTest < FeatureTest
  def test_user_can_edit_a_task_with_new_title_and_description
    #create data
    TaskManager.create({title: "Hello", description: "World"})
    task_id = TaskManager.all.last.id

    # as a guest
    # when I visit the index
    visit '/tasks'
    # and I click on edit
    click_link_or_button("edit")
    #save_and_open_page
    #assert page.has_content?("Hello")
    #click_link_or_button("Edit task")
    # and I fill in the title with --
    fill_in("task[title]", with: "Make cookies")
    # and I fill in the description with --
    fill_in("task[description]", with: "now")
    # and I click "submit"
    click_link_or_button("submit")

    # then I should be show page
    assert_equal "/tasks/#{task_id}", current_path
    # and I should see the new task title
    assert page.has_content?("Make cookies")
    assert page.has_content?("now")
  end
end