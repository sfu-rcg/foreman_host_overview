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
      if host.fqdn
        links = {'VNC' => "vnc://#{host.fqdn}", 'SSH' => "ssh://#{host.fqdn}", 'RDP' => "rdp://#{host.fqdn}"}
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
