module UsersHelper

  def gravatar_for(user, options = {})
    className= "#{options[:class]}" if options.has_key?(:class)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.username, class: className)
  end
  
end
