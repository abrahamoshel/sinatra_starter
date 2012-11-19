module ApplicationHelper
  include Haml::Helpers

  def partial(template, *args)
    template_array = template.to_s.split('/')
    template = template_array[0..-2].join('/') + "/_#{template_array[-1]}"

    options = args.last.is_a?(Hash) ? args.pop : {}
    options.merge!(:layout => false)

    haml(template.to_sym, options)
  end
  
end