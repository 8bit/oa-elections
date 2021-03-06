class BallotPdf < Prawn::Document
  def initialize(election)
    super(top_margin: 30)

    @election = election

    case candidate_rows.count - 1
    when 1..5
      @rows = 3    
    when 6..10
      @rows = 2
    else
      @rows = 1
    end

    define_grid(:columns => 2, :rows => @rows, padding: 10)

    grid.columns.times do |column|
      grid.rows.times do |row|
        grid(row, column).bounding_box do
          dash(2)
          stroke do
            line(bounds.top_right, bounds.bottom_right)
          end if column == 0
          stroke do
            line(bounds.bottom_left, bounds.bottom_right)
          end if row != grid.rows - 1
          undash
          indent 10 do
            header
            candidate_names
            footer
          end
        end
      end
    end

  end
  
  def header
    move_down 10
    text "Ballot for #{@election.unit} OA Election", size: 12, style: :bold
  end

  def footer
    move_down 10
    text "Check to vote for any candidate you wish to be inducted into the Order of the Arrow", size: 12
  end
  
  def candidate_names
    move_down 20
    table candidate_rows do
      row(0).font_style = :bold
      # columns(1).align = :right
      self.row_colors = ["DDDDDD", "FFFFFF"]
      self.header = true
    end
  end

  def candidate_rows
    [["Vote", "Candidate Name"]] +
    @election.candidates.map do |candidate|
      ["", candidate.display_name]
    end
  end
  

end