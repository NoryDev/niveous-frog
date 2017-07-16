# frozen_string_literal: true

# A JobPost Factory
class JobPostDouble
  attr_reader :job_title, :company, :date, :description, :href

  def initialize
    @job_title = 'job_title'
    @company = 'company'
    @date = Date.today
    @description = 'description'
    @href = 'http://www.url.com'
  end
end
