require_relative "../test_helper"

class FrontPageTest < FeatureTest
  def test_user_sees_welcome_message
    visit '/'
    #save_an_open_page
    within('#greeting') do
      assert page.has_content?("Welcome to the Task Manager")
    end
  end
end