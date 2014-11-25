module ForemanHostOverview
  module HostsHelperExtensions
    extend ActiveSupport::Concern
    
    def overview_fields host
      fields = super host
      # Set Certificate Name unless it's already specified
      if fields.detect { |field, value| field.eql? "Certificate Name" }.empty?
        # Doing it this way so the real certname is returned
        # host.certname will return the fqdn if the certname is nil
        fields += [[_("Certificate Name"), host.send(:read_attribute, :certname)]]
      end      
      links = {'VNC' => "vnc://#{host.fqdn}", 'SSH' => "ssh://#{host.fqdn}", 'RDP' => "rdp://#{host.fqdn}"} 
      if host.fqdn
        fields += [[_("Connect"), safe_join(links.map { |url| link_to url[0], url[1] }, ' ') ]]
      end
      fields
    end

  end
end
