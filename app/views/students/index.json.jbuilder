json.array!(@students) do |student|
  json.extract! student, :id, :roll_no, :name, :email
  json.url student_url(student, format: :json)
end
