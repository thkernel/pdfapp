module ApplicationHelper


  def user_avatar(user, alt_tag, class_name)
		

			
		if user.avatar.attached?
				image_tag user.avatar,  class: class_name, alt: alt_tag
		else

				image_tag 'thumb/missing.png',  class: class_name, alt: alt_tag
		end
 
	end

	def structure_plannings(doctor_id, structure)
		planning = Planning.where(["profile_id = ? AND structure_id= ?", doctor_id, structure ]).take
    
		if planning.present?
			@plannings = planning.planning_items
		else
			@plannings = []
		end
    
	end


	def structure_logo(structure, alt_tag, class_name)
		pharmacy = StructureType.find_by(name: "Pharmacie")
		cabinet_medical = StructureType.find_by(name: "Cabinet médical")
		clinique = StructureType.find_by(name: "Clinique")

		polyclinique = StructureType.find_by(name: "Polyclinique")


			
		if  structure.logo.attached?
				image_tag structure.logo,  class: class_name, alt: alt_tag
		elsif structure.structure_type_id == pharmacy.id

			image_tag 'thumb/pharmacy-missing.png',  class: class_name, alt: alt_tag
		
		elsif structure.structure_type_id == cabinet_medical.id
			image_tag 'thumb/doctors-office-missing.jpg',  class: class_name, alt: alt_tag


		elsif structure.structure_type_id == clinique.id
			image_tag 'thumb/doctors-office-missing.jpg',  class: class_name, alt: alt_tag
		
		elsif structure.structure_type_id == polyclinique.id
			image_tag 'thumb/doctors-office-missing.jpg',  class: class_name, alt: alt_tag
		else
			image_tag 'thumb/missing.png',  class: class_name, alt: alt_tag


		end
 
	end

		
	def is_superuser?(user)
		if user.role_id == Role.find_by(name: "superuser").id 
			true
		else
			false 
		end
	end

	def is_administrator?(user)
		if user.role_id == Role.find_by(name: "Administrateur").id 
			true
		else
			false 
		end
	end
	
	def current_structure_admin(current_structure_id)
		
	end

	def is_structure_admin?
		structure_admin = current_user.profile.structure_administrator

		if structure_admin.present?
			true
		else
			false
		end

	end

	def structure_is?(current_structure_id, structure_type)
		current_structure = Structure.find(current_structure_id)
		
		if current_structure.present? && current_structure.structure_type_id == StructureType.find_by(name: structure_type).id
			true 
		else
			false 
		end

	end


	def current_structure
		Structure.find(current_user.profile.structure_administrator.structure_id)
	end

	def belongs_to_current_structure?(doctor)
		work_place_items = WorkPlaceItem.where(structure_id: current_structure.id)
		profiles_id = work_place_items.map {|work_place_item| WorkPlace.find(work_place_item.work_place_id).profile_id}

		if profiles_id.include?(doctor.profile.id)
			true
		else
			false
		end
	end

	def structure_doctors(structure)
		work_place_items = WorkPlaceItem.where(structure_id: structure.id)
        user_ids = work_place_items.map {|work_place_item| WorkPlace.find(work_place_item.work_place_id).user_id}
        
        @doctors = Profile.where("user_id IN (?)", user_ids )
	end

	def general_doctors(structure)
		work_place_items = WorkPlaceItem.where(structure_id: structure.id)
        user_ids = work_place_items.map {|work_place_item| WorkPlace.find(work_place_item.work_place_id).user_id}
				
				general = ["Médecin généraliste"]
				@doctors = Profile.where("user_id IN (?)", user_ids )
				@doctors.where("speciality IN (?)", general)
	end

	def special_doctors(structure)
		work_place_items = WorkPlaceItem.where(structure_id: structure.id)
        user_ids = work_place_items.map {|work_place_item| WorkPlace.find(work_place_item.work_place_id).user_id}
				general = ["Médecin généraliste"]

				@doctors = Profile.where("id IN (?)", user_ids )
				@doctors.where("speciality not IN (?)", general)
	end
	
	def is_from_kosante?(user)
		user_work_place = user.work_place
		kosante = Structure.find_by(name: "Ko-Santé+")
		puts "USER WORK PLACE: #{user_work_place.inspect}"
		if user_work_place.present? && kosante.present?
			work_place_items = WorkPlaceItem.where("work_place_id = ? AND structure_id = ?",  user_work_place.id, kosante.id)
		end

		if work_place_items.present?
			true  
		else  
			false   
		end
	end
	
	def have_result?(analysis_request_id)
		analysis_result = AnalysisResult.find_by(analysis_request_id: analysis_request_id)
		if analysis_result.present?
			true 
		else
			false 
		end
	end
	def have_structure?(user)
		if user.structures.present?
			true
		else
			false
		end
	end

	def user(id)
		User.find(id)
	end
		
	def is_pharmacy?(user)
		if have_structure?(user)
			structure = user.structures.take
			pharmacy = StructureType.find_by(name: "Pharmacie")
			if structure.structure_type_id == pharmacy.id
				true
			end
		else
			false
		end
	end

	
	def is_patient?(user)
		patient = Profile.find_by(user_id: user.id)
		if patient.present? && patient.profile_type == "Patient"
			true
		else
			false
		end
	end

	def is_laboratory?(user)
		if have_structure?(user)
			structure = user.structures.take
			laboratory = StructureType.find_by(name: "Laboratoire")
			if structure.structure_type_id == laboratory.id
				true
			end
		else
			false
		end
	end

	def not_need_workplace?(speciality_id)
		
	end


		
		def uncomplete_profile?
			
	
		end

		


end
