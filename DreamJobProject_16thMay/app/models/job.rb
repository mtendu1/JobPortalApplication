class Job < ActiveRecord::Base

  belongs_to :employer
  has_and_belongs_to_many :jobseekers

  validates :company_name, :job_title, :job_code, :job_location, :job_description, :job_type, presence: true
  validates :job_description, length: {minimum: 10, maximum: 100}

    def self.search(search)
      if search
        self.where(("job_title like ? "), "%#{search}%")
      else
        self.all
      end
    end
end
