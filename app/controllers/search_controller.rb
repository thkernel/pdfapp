class SearchController < ApplicationController
  layout "front"


  def index
 

		#@providers = User.search_providers(query)
		@providers = Profile.by_profile_type("Prestataire").order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)

	
	

  end
  
  def search_doctors

    @doctors = nil
    @localities = Locality.all

    @locality = params[:locality] unless params[:locality].blank?
    @misc = params[:misc] unless params[:misc].blank?

    if @locality.present? && @misc.present?

      search_by_speciality_and_locality = Profile.by_profile_type("Prestataire").search_by_speciality_and_locality(@misc, @locality).order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)
      search_by_names_and_locality = Profile.by_profile_type("Prestataire").search_by_full_name(@misc).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
      search_by_structure_and_locality = Profile.joins(:structure_profiles).where("structure_profiles.structure_id" => Structure.where("lower(name) LIKE ?",  "#{@misc.downcase}").take ).order(created_at: :desc).paginate(:page => params[:page], :per_page => 12)

      if search_by_speciality_and_locality.present?
        puts "SEARCH BY SPECIALITY"

        @doctors = search_by_speciality_and_locality
      elsif search_by_names_and_locality.present?
        puts "SEARCH BY NAMES"

        @doctors = search_by_names_and_locality
      elsif
        
        
          @doctors = search_by_structure_and_locality
        
        puts "SEARCH BY STRUCTURE: #{@doctors.inspect}"
      end

    elsif !@locality.present? && @misc.present?
      puts "NULL LOCALITY"

      search_by_speciality = Profile.by_profile_type("Prestataire").search_by_speciality(@misc).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
      search_by_names = Profile.by_profile_type("Prestataire").search_by_full_name(@misc).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
      search_by_structure = Profile.joins(:structure_profiles).where("structure_profiles.structure_id" => Structure.where("lower(name) LIKE ?",  "#{@misc.downcase}").take ).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)

      if search_by_speciality.present?
        puts "SEARCH BY SPECIALITY"

        @doctors = search_by_speciality
      elsif search_by_names.present?
        puts "SEARCH BY NAMES"

        @doctors = search_by_names
      elsif
        
        
          @doctors = search_by_structure
        
        puts "SEARCH BY STRUCTURE: #{@doctors.inspect}"
      end

    else

      puts "ALL CASE SEARCH"
      @doctors = Profile.by_profile_type("Prestataire").order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)

    end
  end 
  

  def search_medicaments_or_analyses
    @misc = params[:misc]
   puts "MISC: #{@misc}"
    medicaments = Medicament.search_by_name(@misc).where(status: "enabled").order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    analyses = Analysis.search_by_name(@misc).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)

    if medicaments.present?
      @medicaments = medicaments
      return @medicaments
    elsif analyses.present?
      @analyses = analyses
      return @analyses
    end
    
  end

  def show
  end
end
