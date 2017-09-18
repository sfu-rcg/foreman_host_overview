class Setting::ForemanHostOverview < ::Setting
  def self.load_defaults
    return unless ActiveRecord::Base.connection.table_exists?('settings')
    return unless super

    Setting.transaction do
      [
        self.set(
          'display_non_native_connections',
          N_('Whether or not to display non-native OS connections'),
          true
        ),
        self.set(
          'use_ip_for_connections',
          N_('Use ip address for connection links instead of fqdn'),
          false
        )
      ].compact.each { |s| self.create! s.update(:category => 'Setting::ForemanHostOverview') }
    end

    true
  end
end
