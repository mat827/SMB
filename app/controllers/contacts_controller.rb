class ContactsController < ApplicationController
  before_action only: [:new, :show, :edit, :destroy]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.contact_mail(@contact).deliver
      redirect_to stretchs_path,notice: '質問を送信しました'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admins_contacts_path,notice: '質問を削除しました'
    # respond_to do |format|
    #   format.html { redirect_to admins_contact_path, notice: 'Contact was successfully destroyed.' }
    #   format.json { head :no_content }
    end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
