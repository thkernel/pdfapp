class ContactFormsController < ApplicationController
    layout "front"
    def become_partner_form
    end

    def become_partner

        respond_to do |format|
            
              format.html { redirect_to root_path, notice: 'Envoyé avec succès.' }
              format.json { render :show, status: :created, location: @locality }
              format.js
            
          end
    end

end