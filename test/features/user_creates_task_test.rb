require_relative "../test_helper"

class CreateTaskTest < FeatureTest
  def test_user_can_create_a_task_with_title_and_description
    # as a guest
    # when I visit the root path
    visit '/'
    # and I click on "new task"
    within("#links") do
      click_link_or_button("New Task")
    end
    # and I fill in the title with --
    fill_in("task[title]", with: "Make cookies")
    # and I fill in the description with --
    fill_in("task[description]", with: "now")
    # and I click "submit"
    click_link_or_button("Create task")
    # then I should be on the task index
    assert_equal '/tasks', current_path
    # and I should see the new task title
    assert page.has_content?("Make cookies")
  end
end