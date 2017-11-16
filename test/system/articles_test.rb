require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  test "visiting the index" do
    visit root_url
    assert_selector "h3", text: "Lets get your reactions"
  end
end
