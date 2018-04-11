require 'test_helper'

class CreateNewArticleTest < ActionDispatch::IntegrationTest

    def setup

      @user = User.create(username: "teste2", email: "teste2@example.com", password: "teste2", admin: "false")
    end

    test "Create new article" do
      sign_in_as(@user, "teste2")
      get new_article_path
      assert_template 'articles/new'
      assert_difference 'Article.count', 1 do
        post articles_path, params: { article: {title: "testing new article", description: "integration teste article description", category: "sports"}}
        follow_redirect!
      end
      assert_template 'articles/show'
      assert_match "title", response.body
      assert_match "description", response.body
    end
end
