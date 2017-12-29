Facter.add(:rabbitmq_version) do
  setcode do
    if Facter::Util::Resolution.which('rabbitmqctl')
      rabbitmq_version = Facter::Core::Execution.execute('rabbitmqctl status 2>&1')
      %r{\{rabbit,"RabbitMQ","((\d).(\d).(\d))"\}}.match(rabbitmq_version)[1]
    end
  end
end
