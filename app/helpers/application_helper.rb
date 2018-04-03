module ApplicationHelper
  def gravatar_for(user, options = {size:80})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/HASH#{gravatar_id}?s=#{size}"
    #gravatar_url = "https://secure.gravater.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: "image-circle")
  end
end
