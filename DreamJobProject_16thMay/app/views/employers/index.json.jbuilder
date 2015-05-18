json.array!(@employers) do |employer|
  json.extract! employer, :id, :company_name, :company_phone, :ein, :contact_person_name
  json.url employer_url(employer, format: :json)
end
