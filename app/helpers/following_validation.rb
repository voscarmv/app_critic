class FollowingValidation < ActiveModel::Validator
  def validate(record)
    record.errors[:name] << "You can't invite yourself" if record.followedid == record.followerid
  end
end
