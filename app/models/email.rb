class Email < ApplicationRecord

  belongs_to :sender, class_name: "User", primary_key: "id"
  belongs_to :recipient, class_name: "User", primary_key: "id"
  belongs_to :cc, class_name: "User", primary_key: "id"
  belongs_to :bcc, class_name: "User", primary_key: "id"
end
