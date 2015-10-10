class Chef
  class Resource
    class DockerService < Chef::Resource::LWRPBase
      # Manually set the resource name because we're creating the classes
      # manually instead of letting the resource/ and providers/
      # directories auto-name things.
      self.resource_name = :docker_service

      # service actions
      actions :create, :delete, :start, :stop, :restart
      default_action :create

      # register with the resource resolution system
      provides :docker_service if Chef::Provider.respond_to?(:provides)

      # service installation
      attribute :source, kind_of: String, default: nil
      attribute :version, kind_of: String, default: nil
      attribute :checksum, kind_of: String, default: nil

      # daemon runtime arguments
      attribute :instance, kind_of: String, name_attribute: true, required: true
      attribute :api_cors_header, kind_of: String, default: nil
      attribute :bridge, kind_of: String, regex: [IPV4_ADDR, IPV6_ADDR], default: nil
      attribute :bip, kind_of: String, regex: [IPV4_ADDR, IPV4_CIDR, IPV6_ADDR, IPV6_CIDR], default: nil
      attribute :debug, kind_of: [TrueClass, FalseClass], default: nil
      attribute :daemon, kind_of: [TrueClass, FalseClass], default: true
      attribute :dns, kind_of: [String, Array], default: []
      attribute :dns_search, kind_of: Array, default: nil
      attribute :exec_driver, equal_to: %w(native lxc), default: nil
      attribute :fixed_cidr, kind_of: String, default: nil
      attribute :fixed_cidr_v6, kind_of: String, default: nil
      attribute :group, kind_of: String, default: nil
      attribute :graph, kind_of: String, default: nil
      attribute :host, kind_of: [String, Array], default: nil
      attribute :icc, kind_of: [TrueClass, FalseClass], default: nil
      attribute :insecure_registry, kind_of: String, default: nil
      attribute :ip, kind_of: String, regex: [IPV4_ADDR, IPV6_ADDR], default: nil
      attribute :ip_forward, kind_of: [TrueClass, FalseClass], default: nil
      attribute :ipv4_forward, kind_of: [TrueClass, FalseClass], default: true
      attribute :ipv6_forward, kind_of: [TrueClass, FalseClass], default: true
      attribute :ip_masq, kind_of: [TrueClass, FalseClass], default: nil
      attribute :iptables, kind_of: [TrueClass, FalseClass], default: nil
      attribute :ipv6, kind_of: [TrueClass, FalseClass], default: nil
      attribute :log_level, equal_to: [:debug, :info, :warn, :error, :fatal], default: nil
      attribute :label, kind_of: String, default: nil
      attribute :log_driver, equal_to: %w( json-file syslog journald gelf fluentd none ), default: nil
      attribute :log_opts, kind_of: [String, Array], default: []
      attribute :mtu, kind_of: String, default: nil
      attribute :pidfile, kind_of: String, default: nil
      attribute :registry_mirror, kind_of: String, default: nil
      attribute :storage_driver, kind_of: [String, Array], default: nil
      attribute :selinux_enabled, kind_of: [TrueClass, FalseClass], default: nil
      attribute :storage_opts, kind_of: [String, Array], default: []
      attribute :tls, kind_of: [TrueClass, FalseClass], default: nil
      attribute :tls_verify, kind_of: [TrueClass, FalseClass], default: nil
      attribute :tls_ca_cert, kind_of: String, default: nil
      attribute :tls_server_cert, kind_of: String, default: nil
      attribute :tls_server_key, kind_of: String, default: nil
      attribute :tls_client_cert, kind_of: String, default: nil
      attribute :tls_client_key, kind_of: String, default: nil
      attribute :default_ulimit, kind_of: [String, Array], default: nil
      attribute :userland_proxy, kind_of: [TrueClass, FalseClass], default: nil

      # environment variables to set before running daemon
      attribute :http_proxy, kind_of: String, default: nil
      attribute :https_proxy, kind_of: String, default: nil
      attribute :no_proxy, kind_of: String, default: nil
      attribute :tmpdir, kind_of: String, default: nil

      # logging
      attribute :logfile, kind_of: String, default: '/var/log/docker.log'

      alias_method :tlscacert, :tls_ca_cert
      alias_method :tlscert, :tls_server_cert
      alias_method :tlskey, :tls_server_key
      alias_method :tlsverify, :tls_verify

      include DockerHelpers
    end
  end
end
