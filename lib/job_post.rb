# frozen_string_literal: true

# JobPost represents a job post obtained from the website
#
# @param [String] job_title job title
# @param [String] company company name
# @param [Date] date date it was posted
# @param [String] description summary description of the job
# @param [String] href url of the full description
class JobPost
  attr_reader :job_title, :company, :date, :description, :href

  def initialize(job_title:, company:, date:, description:, href:)
    @job_title = job_title
    @company = company
    @date = date
    @description = description
    @href = href
  end
end
