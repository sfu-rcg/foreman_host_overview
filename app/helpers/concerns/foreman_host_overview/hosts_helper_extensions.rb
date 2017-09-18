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
      connect_addr = Setting[:use_ip_for_connections] ? host.ip : host.fqdn
      if connect_addr
        links = {
          'VNC' => "vnc://#{connect_addr}",
          'SSH' => "ssh://#{connect_addr}",
          'RDP' => "rdp://#{connect_addr}"
        }
        # If host.os returns nil, we can't effectively determine what OS the machine is
        unless (Setting[:display_non_native_connections] or host.os.nil?)
          if host.os.type =~ /Windows/
            # Assume it's a Windows box
            links.except! 'VNC', 'SSH'
          else
            # Assume it's a Linux box
            links.except! 'RDP'
          end
        end
        fields += [[_("Connect"), safe_join(links.map { |url| link_to url[0], url[1] }, ' ') ]]
      end
      fields
    end

  end
end
