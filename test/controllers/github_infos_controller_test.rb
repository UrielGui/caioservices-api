require "test_helper"

class GithubInfosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @github_info = github_infos(:one)
  end

  test "should get index" do
    get github_infos_url, as: :json
    assert_response :success
  end

  test "should create github_info" do
    assert_difference("GithubInfo.count") do
      post github_infos_url, params: { github_info: { github_token: @github_info.github_token, repository_route: @github_info.repository_route, user_id: @github_info.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show github_info" do
    get github_info_url(@github_info), as: :json
    assert_response :success
  end

  test "should update github_info" do
    patch github_info_url(@github_info), params: { github_info: { github_token: @github_info.github_token, repository_route: @github_info.repository_route, user_id: @github_info.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy github_info" do
    assert_difference("GithubInfo.count", -1) do
      delete github_info_url(@github_info), as: :json
    end

    assert_response :no_content
  end
end
