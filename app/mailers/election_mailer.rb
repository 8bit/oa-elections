class ElectionMailer < ActionMailer::Base
  default from: "admin@scouting.io"

  def coordinator_email(election)
    @election = election
    @url  = election_candidates_url(@election)
    mail(to: @election.coordinator_email, subject: 'OA Election Request Received -- Please start adding candidates.')
  end
end
