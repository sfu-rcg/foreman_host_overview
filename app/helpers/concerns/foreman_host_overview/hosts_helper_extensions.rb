module ForemanHostOverview
  module HostsHelperExtensions
    extend ActiveSupport::Concern
    
    def overview_fields host
      fields = super host
      # So we get the real certname
      fields += [[_("Certificate Name"), host.send(:read_attribute, :certname)]]
      fields += [[_("VNC"), link_to("vnc://#{host.fqdn}", "vnc://#{host.fqdn}")]] if host.fqdn
      fields += [[_("RDP"), link_to("rdp://#{host.fqdn}", "rdp://#{host.fqdn}")]] if host.fqdn
      fields
    end

  end
end
