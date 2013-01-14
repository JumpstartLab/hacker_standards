class StandardDecorator < ApplicationDecorator
  decorates :standard

  def delete_link
    h.link_to "delete", h.standard_path(standard), :method => :delete, :confirm => "Delete \"#{ standard.title }\"?", :id => h.dom_id(standard, 'delete'), :class => 'btn'
  end

  def edit_link
    h.link_to "edit", h.edit_standard_path(standard), :id => h.dom_id(standard, 'edit'), :class => 'btn'
  end
end