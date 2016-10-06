class GoogleCloudPubSub < ActiveJob::Base
  class << self
    def initialize
      gcloud = Google::Cloud.new "gmail-api-145315", "/Users/ch0chip/code/web/rails_gmail_test/gmail_api.json"
      pubsub = gcloud.pubsub
    end

    def test
      binding.pry
      pubsub = self.initialize

      ## create a topic
      # topic = pubsub.create_topic "my-topic"

      # Retrieve a topic
      topic = pubsub.topic "my-topic"

      # Publish a new message
      msg = topic.publish "new-message"

      ## create a subscription
      # sub = topic.subscribe "my-topic-sub"


      # Retrieve a subscription
      sub = pubsub.subscription "my-topic-sub"

      # Pull available messages
      msgs = sub.pull
    end
  end
end