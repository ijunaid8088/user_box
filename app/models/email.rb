class Email < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader 
  
  after_create_commit { EmailsBroadcastJob.perform_later(self) }
  belongs_to :sender, class_name: "User", primary_key: "id"
  belongs_to :recipient, class_name: "User", primary_key: "id"

  # belongs_to :cc, class_name: "User", primary_key: "cc"
  # belongs_to :bcc, class_name: "User", primary_key: "bcc"
end
