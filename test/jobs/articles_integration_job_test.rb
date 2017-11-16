require 'test_helper'

class ArticlesIntegrationJobTest < ActiveJob::TestCase
  test 'that integration gets 3 articles' do
    assert_difference('Article.count', +3) do
      ArticlesIntegrationJob.perform_now
    end
   end
end
