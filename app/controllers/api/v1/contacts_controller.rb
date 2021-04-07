class Api::V1::ContactsController < Api::V1::BaseController
  def index
    @contacts = Contact.all

    render json: @contacts
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save!
      render json: @contact, status: :ok
    else
      render json: { successfull: "ERROR: Not a valid model" }
    end
  end

  def destroy
    @contact = Contact.find(params[:id])

    if @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email)
  end 
end
