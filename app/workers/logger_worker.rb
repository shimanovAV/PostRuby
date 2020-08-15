class LoggerWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  def perform(post_id, rate)
    logger.info "Post id - #{post_id}, rate - #{rate}"
  end

end