module ApplicationHelper
  include Pagy::Frontend
  
  def tailwind_classes_for(flash_type)
    {
      success: "bg-green-400 border-l-4 border-green-700 text-white",
      notice: "bg-blue-400 border-l-4 border-blue-700 text-white",
      error:   "bg-red-400 border-l-4 border-red-700 text-white",
      alert:   "bg-red-400 border-l-4 border-red-700 text-white"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
  
  def applicant_status_color(status)
    case status
    when 'pending'
      'bg-yellow-500'
    when 'approved'
      'bg-green-500'
    when 'rejected'
      'bg-red-500'
    else
      'bg-gray-500'
    end
  end

  def applicant_status_text(status)
    case status
    when 'pending'
      'Pendente'
    when 'approved'
      'Aprovado'
    when 'rejected'
      'Rejeitado'
    else
      'Desconhecido' # Default text
    end
  end
end
