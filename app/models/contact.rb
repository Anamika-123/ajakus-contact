class Contact < ApplicationRecord
  ##validations
  validates :firstname, :email, :message,  presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, allow_blank: true

  ##callbacks
  after_commit :notify_internal_team, on: :create

  def notify_internal_team
    ContactMailer.email_for_new_contact(self.id).deliver_later
  end 
end
