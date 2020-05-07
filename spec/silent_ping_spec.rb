require "rubygems"

RSpec.describe SilentPing do
  it "has a version number" do
    expect(SilentPing::VERSION).not_to be(nil)
  end

  def setup
    @app = Class.new(Rails::Application)
    @app.config.eager_load = false
    @app.initialize!

    @logs = StringIO.new
    Rails.logger = Logger.new(@logs)
  end

  def request(uri)
    Rack::MockRequest.env_for(uri)
  end

  before do
    setup
    @app.call(request(path))
  end

  let(:path) { SilentPing::Pong::PATH }

  it "replaces Rails::Logger::Rack with SilentPing::Logger" do
    expect(@app.middleware).to include(described_class::Logger)
    expect(@app.middleware).not_to include(::Rails::Rack::Logger)
  end

  it "adds SilentPing::Pong to middleware" do
    expect(@app.middleware).to include(described_class::Pong)
  end

  it "doesn't log GET /ping" do
    expect(@logs.string).to eq("")
  end

  context "path is not /ping" do
    let(:path) { "/foo" }

    it "logs GET /foo" do
      expect(@logs.string).to include("Started GET \"/foo\"")
    end
  end
end
