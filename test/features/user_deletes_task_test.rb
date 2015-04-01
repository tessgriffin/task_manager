require_relative "../test_helper"

class DeleteTaskTest < FeatureTest
  def test_user_can_delete_task
    # create data
    TaskManager.create({title: "Hello", description: "World"})

    # execute stuff
    # as a guest
    # when I visit the index
    visit '/tasks'
    assert page.has_content?("Hello")
    click_link_or_button("delete")

    #assertions
    # then I should be show page
    assert_equal '/tasks', current_path
    # and I don't see the deleted task
    refute page.has_content?("Hello")
  end
end