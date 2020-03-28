json.extract! profile, :id, :first_name, :last_name, :gender, :birth_date, :city, :country, :about, :marital_status, :cut, :weight, :eyes, :hair, :sexual_orientation, :occupation, :astrology, :region, :nationality, :purpose, :created_at, :updated_at
json.url profile_url(profile, format: :json)
