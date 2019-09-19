module ZypeApi
  class Client
    include HTTParty
    format :json
    debug_output $stdout

    def initialize(options = {})
      self.class.base_uri(options.fetch(:base_uri, "#{zype_api_base_uri}/videos"))
      self.class.headers(default_headers.merge(options.fetch(:headers, {})))
    end

    def get_all(options = { format: :plain })
      response = self.class.get('', options.merge(query: { app_key: app_key }))
      JSON.parse response, symbolize_names: true
    end
    
    def get(id, options = {})
      response = self.class.get("/#{id}", options)
      JSON.parse response, symbolize_names: true
    end

    private 

    def app_key
      'XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf'
    end

    def zype_api_base_uri
      @zype_api_uri = 'https://api.zype.com'
    end

    def default_headers
      @default_headers ||= {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
        # 'Authorization' => AuthToken.encode(user_id: Thread.current[:current_user].id)
      }
    end
  end
end