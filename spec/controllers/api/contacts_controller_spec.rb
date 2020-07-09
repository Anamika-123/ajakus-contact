require 'rails_helper'

describe Api::ContactsController do
	describe 'index' do
		it 'assigns @contact' do
			get(:index)

			expect(assigns(:contact)).not_to be_nil
			expect(assigns(:contact)).to be_an_instance_of(Contact)
		end
	end

	describe 'create' do
		context 'when the contact is saved succesfully' do
			it 'redirects to root' do
				post(:create, params: { contact: {
					firstname: 'Anamika',
					email: 'indorianamika@gmail.com',
					message: 'Hi, Please provide feedback'
				} })

				is_expected.to redirect_to(:root)
			end
		end

		context 'when the contact is failed to save' do
			it 'renders index' do
				post(:create, params: { contact: { firstname: 'Anamika' } })

				is_expected.to render_template(:index)
			end
		end
	end
end
