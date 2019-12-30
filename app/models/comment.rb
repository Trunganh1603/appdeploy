class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  #after_create_commit { RenderCommentJob.perform_later self }
  after_create_commit { notify }
  
private
 
  def notify
    Notification.create(event: "New Notification")
  end
end
