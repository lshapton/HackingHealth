json.array!(@goals) do |goal|
  json.extract! goal, :id, :description, :question_1, :question_2, :question_3, :question_4, :patient_id
  json.url goal_url(goal, format: :json)
end
