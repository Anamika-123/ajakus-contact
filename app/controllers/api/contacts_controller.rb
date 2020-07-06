class Api::ContactsController < Api::BaseController
  
  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    respond_to do |format|
      if @contact.save
        format.html { redirect_to root_path }
        format.json { render json: { message: "Success" }, status: 200 }
      else
        format.html { render :index }
        format.json { render json: { message: "Failed", errors: @contact.errors }, status: 422 }
      end
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:firstname, :lastname, :email, :phone_number, :email, :message)
    end
end
