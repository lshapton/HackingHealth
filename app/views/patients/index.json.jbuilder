json.array!(@patients) do |patient|
  json.extract! patient, :id, :given_name, :preferred_name, :surname, :dob, :health_care_number, :telephone, :email
  json.url patient_url(patient, format: :json)
end
