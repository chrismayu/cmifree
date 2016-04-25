module UrlHelper
  def url_for(options = nil)
    if options.is_a?(Hash) && options.has_key?(:subdomain)
      options[:host] = host_with options.delete(:subdomain)
    end
    super
  end

  def host_with(subdomain)
    subdomain += '.' unless subdomain.blank?
    [ subdomain, request.domain, request.port_string ].join
  end
end