# frozen_string_literal: true

# Helper for reading secrets => Can be replaced by AWS Secret Manager
class SecretsHelper
  def secrets
    data = File.read(
      File.join(
        File.dirname(__FILE__),
        '../config/secrets.json'
      )
    )
    JSON.parse(data)[SELECTED_ENV]
  end
end
