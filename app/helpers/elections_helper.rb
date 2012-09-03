module ElectionsHelper
  
  def status_label(election)
    status = election.status
    label_class = ['label']
    case status
    when 'completed'
      label_class << 'label-success'
    when 'refused'
      label_class << 'label-important'
    when 'pending'
      label_class << 'label-info'
    end
    content_tag :span, :class => label_class.join(' ') do
     status.capitalize
   end
  end
end
