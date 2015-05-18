json.array!(@jobseekers) do |jobseeker|
  json.extract! jobseeker, :id, :name, :phone, :address
  json.url jobseeker_url(jobseeker, format: :json)
end
