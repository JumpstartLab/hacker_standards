module ApplicationHelper
  def flash_name_to_bootstrap(flash_key)
    case flash_key.to_s
      when 'message' then 'info'
      when 'error' then 'error'
      when 'alert' then 'warning'
    end
  end
end
