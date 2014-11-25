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
      fields += [[_("VNC"), link_to("vnc://#{host.fqdn}", "vnc://#{host.fqdn}")]] if host.fqdn
      fields += [[_("RDP"), link_to("rdp://#{host.fqdn}", "rdp://#{host.fqdn}")]] if host.fqdn
      fields
    end

  end
end
