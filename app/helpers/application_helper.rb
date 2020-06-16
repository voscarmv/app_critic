module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def user_avatar(user, size=40)
    if user.photo.attached?
      user.photo.variant(resize: "#{size}x#{size}!")
    else
      gravatar_image_url(user.email, size: size)
    end
  end

  def user_cover(user)
    if user.coverimage.attached?
      user.coverimage.variant(resize: "600x200!")
    else
      "default_cover.jpg"
    end
  end
end
