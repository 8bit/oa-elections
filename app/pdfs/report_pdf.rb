class ReportPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper
  def initialize(election)
    super(top_margin: 30, page_layout: :landscape)

    @election = election

    case candidate_rows.count - 1
    when 1..5
      @rows = 3    
    when 6..10
      @rows = 2
    else
      @rows = 1
    end

    define_grid(:columns => 12, :rows => 12, padding: 10)

    header
    summary
    candidates_list
    footer

  end
  
  def header
    move_down 10
    grid([0,0], [0,11]).bounding_box do
      text "2013 Unit Election Report", size: 18, style: :bold, align: :center
    end
  end

  def summary
    grid([1,0],[3,5]).bounding_box do
      table [[" ", " "],
      ["Active Scouts",@election.num_scouts_active],
      ["Scouts Present", @election.num_scouts_present],
      ["Candidates", @election.candidates.count]], width: 350
    end
    grid([1,6],[3,11]).bounding_box do
      table [["", "Ballot 1","Ballot 2"],
      ["Ballots Collected:", @election.ballot_one_count, @election.ballot_two_count],
      ["Votes Required:", if(@election.ballot_one_count) then @election.ballot_one_count / 2 end , if(@election.ballot_two_count) then @election.ballot_two_count / 2 end ],
      ["Number Elected:", unless(@election.ballot_two_count.try(:present?)) then @election.candidates.elected.count end, if(@election.ballot_two_count && @election.ballot_two_count > 0) then @election.candidates.elected.count end]], width: 350
    end
  end
  
  def candidates_list
    grid([4,0],[8,11]).bounding_box do
      table candidate_rows do
        # row(0).font_style = :bold
        columns(0).align = :center
        self.row_colors = ["DDDDDD", "FFFFFF"]
        self.header = true
        self.width = 700
      end
    end
  end

  def footer
    move_down 10
    grid([11,0], [11,11]).bounding_box do
      text "Elections must be completed by the Chapter Election Team or Chapter Adviser no later than November 18.", size: 12, style: :bold, align: :center
    end
  end
  

  def candidate_rows
    [["Elected", "Candidate Name", "Rank", "DOB", "BSA ID", make_table([["Home Phone"], ["Mobile Phone"]], :cell_style => {:borders => []}), make_table([["Scout Email"], ["Parent Email"]], :cell_style => {:borders => []})]] +
    @election.candidates.map do |candidate|
      [candidate.elected ? "X": "", candidate.display_name, candidate.rank, candidate.dob, candidate.bsa_id, make_table([[number_to_phone(candidate.phone_home)], [number_to_phone(candidate.phone_mobile)]], :cell_style => {:borders => []}), make_table([[candidate.email_scout], [candidate.email_parent]], :cell_style => {:borders => []})]
    end
  end
  

end