module CandidateHelper
  def gender_icon(g)
    case g
    when 'male'
      icon = 'fa fa-mars'
    when 'female'
      icon = 'fa fa-venus'
    end
    "<i class='#{icon}'></i>"
  end
end
