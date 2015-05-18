json.array!(@jobs) do |job|
  json.extract! job, :id, :company_name, :job_title, :job_code, :job_location, :job_description, :job_type, :date
  json.url job_url(job, format: :json)
end
