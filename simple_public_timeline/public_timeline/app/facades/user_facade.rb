class UserFacade
  STATUSES_BATCH_SIZE = 20

  def user_posts
    service = UserService.new

    json = service.statuses(STATUSES_BATCH_SIZE)

    json.map do |user_data| 
      Post.new(user_data)
    end
  end
end