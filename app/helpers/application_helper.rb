module ApplicationHelper
	def alert_for(flash_type)
	  { success: 'alert-success',
	    error: 'alert-danger',
	    alert: 'alert-warning',
	    notice: 'alert-info'
	  }
	  [flash_type.to_sym] || flash_type.to_s
	end

	def form_image_select(post)
	  return image_tag post.image.thumb.url,
	                   id: 'image-preview',
	                   class: 'img-responsive' if post.image.thumb.present?
	  image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
	end

	def profile_avatar_select(user)
		return image_tag user.avatar.thumb.url,
					id: 'image-preview',
					class: 'img-responsive img-circle profile-image' if user.avatar.thumb.present?
				image_tag 'link.png', id: 'image-preview',
					class: 'img-responsive img-circle profile-image'						
	end

end