class PartnerMessagesController < ApplicationController
    layout "front"
    def new
        @partner_message = PartnerMessage.new
    end

    def create
        @partner_message = PartnerMessage.new(partner_message_params)

        if @partner_message.valid?

            Thread.new do
                Rails.application.executor.wrap do
                    PartnerMessageMailer.contact(@partner_message).deliver_now
                end 
            end

            redirect_to root_path
            flash[:notice] = "Nous avons reçu votre message et nous vous contacterons bientôt!"
        else
          flash[:alert] = "Une erreur est survenue lors de l'envoi de votre message. Veuillez réessayer."
          render :new
        end
    end

    private
        def partner_message_params
            params.require(:partner_message).permit(:name, :email, :phone, :subject, :body)
        end


end
