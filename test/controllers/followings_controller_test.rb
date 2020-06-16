require 'test_helper'

class FollowingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @following = followings(:one)
  end

  test 'should get index' do
    get followings_url
    assert_response :success
  end

  test 'should get new' do
    get new_following_url
    assert_response :success
  end

  test 'should create following' do
    assert_difference('Following.count') do
      # rubocop:disable LineLength
      post followings_url, params: { following: { Followedid: @following.Followedid, Followerid: @following.Followerid } }
      # rubocop:enable LineLength
    end

    assert_redirected_to following_url(Following.last)
  end

  test 'should show following' do
    get following_url(@following)
    assert_response :success
  end

  test 'should get edit' do
    get edit_following_url(@following)
    assert_response :success
  end

  test 'should update following' do
    # rubocop:disable LineLength
    patch following_url(@following), params: { following: { Followedid: @following.Followedid, Followerid: @following.Followerid } }
    # rubocop:enable LineLength
    assert_redirected_to following_url(@following)
  end

  test 'should destroy following' do
    assert_difference('Following.count', -1) do
      delete following_url(@following)
    end

    assert_redirected_to followings_url
  end
end
