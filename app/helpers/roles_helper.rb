module RolesHelper
    def role(id)
        Role.find(id)
    end
end
