require 'rails_helper'

describe Contact do
	describe 'Validations' do
		it { is_expected.to validate_presence_of(:firstname) }
		it { is_expected.to validate_presence_of(:email) }
		it { is_expected.to validate_presence_of(:message) }

		it "checks for email format" do
			contact = Contact.new(email: 'incorrect_format')
			contact.valid?
			
			errors = contact.errors.details[:email].map { |error| error[:value] }
			expect(errors).to include('incorrect_format')
		end
	end

	describe 'Callbacks' do
		describe 'after_comit' do
			describe 'notify_internal_team' do
				it 'calls email_for_new_contact on ContactMailer' do
					expect(ContactMailer).to receive_message_chain(:email_for_new_contact, :deliver_later)

					Contact.create(
						firstname: 'Anamika',
						email: 'indorianamika@gmail.com',
						message: 'Please contact me on my email'
					)
				end
			end
		end
	end
end
