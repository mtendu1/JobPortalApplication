class Appliedjob < ActiveRecord::Base

  belongs_to :jobseeker
  belongs_to :job
end
