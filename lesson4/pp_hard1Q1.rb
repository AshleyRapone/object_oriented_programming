class SecretFile

  def initialize(secret_data, logger)
    @data = secret_data
    @logger = logger
  end

  def data
    @logger.create_log_entry
    @data
  end
end

class SecurityLogger
  def create_log_entry
    # ... implementation omitted ...
  end
end

logger = SecurityLogger.new
file = SecretFile.new('secret', logger)

=begin
Alyssa has been assigned a task of modifying a class that was initially created to
keep track of secret information. The new requirement calls for adding logging, when
clients of the class attempt to access the secret data.
She needs to modify it so that any access to data must result in a log entry being generated.
That is, any call to the class which will result in data being returned must first call a logging class.
Hint: Assume that you can modify the initialize method in SecretFile to have an instance of SecurityLogger be passed in as an additional argument.
=end
