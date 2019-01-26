Rails.configuration.active_job.queue_adapter =
  Rails.env.test? ? :inline : :sucker_punch
