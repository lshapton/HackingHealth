json.array!(@healthcare_professionals) do |healthcare_professional|
  json.extract! healthcare_professional, :id, :name, :role
  json.url healthcare_professional_url(healthcare_professional, format: :json)
end
