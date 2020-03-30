# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Capistrano-rails-collection cammands
#cap production rails:rake:log:clear
#cap production rails:rake:tmp:clear
#cap production rails:rake:db:drop
#cap production rails:rake:db:reset
#cap production rails:rake:db:setup
#cap production rails:rake:db:seed
#cap production rails:rake:db:migrate
#cap production rails:rake:db:rollback

unless Role.all.present?
    roles = Role.create(
        [
            {name: "superuser"},
            {name: "Administrateur"},
            {name: "Demo"},
            {name: "Editeur"},
            {name: "Contributeur"},
            {name: "Visiteur"},
           
            
        ])
else
    roles = Role.all

end



# Users
unless User.all.present?
    users = User.create([
        {login: "superuser",  email: "superuser@gmail.com",  password: "AMOSXZIBITDE88", password_confirmation: "AMOSXZIBITDE88", role_id: Role.find_by(name: "superuser").id},
        {login: "demo", email: "demo@gmail.com", password: "Root@2019#!*", password_confirmation: "Root@2019#!*", role_id: Role.find_by(name: "superuser").id},


    
    ])
else   
    users = User.all
end




#Post categories
unless PostType.all.present?
    post_type = PostType.create([
        
        {
            name: "PDF", 
            user_id: User.find_by(role_id: Role.find_by(name: "superuser").id).id
            
        },
        {
            name: "Article", 
            user_id: User.find_by(role_id: Role.find_by(name: "superuser").id).id
            
        }
    
    ])
else
    post_types = PostType.all

end

#Post categories
unless PostCategory.all.present?
    post_category = PostCategory.create([
        
        {
            name: "Sans nom", 
            user_id: User.find_by(role_id: Role.find_by(name: "superuser").id).id
            
        },
        {
            name: "Rechauffement climatique", 
            user_id: User.find_by(role_id: Role.find_by(name: "superuser").id).id
            
        }
    
    ])
else
    post_categories = PostCategory.all

end


#Rapport annuelle mondiale 2018 sur le rechaffement climatique