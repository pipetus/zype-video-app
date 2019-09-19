module ZypeApi
  class Client
    include HTTParty
    format :json

    def initialize(options = {})
      self.class.base_uri(options.fetch(:base_uri, "#{zype_api_base_uri}/videos"))
      self.class.headers(default_headers.merge(options.fetch(:headers, {})))
    end

    def get_all
      perform
    end
    
    def get(id)
      perform("/#{id}")
    end
    
    def app_key
      'XWny5j0V89yb1uZu6SI_D95EADV5FzBYldE9Ny0_q0GOzcWLiruPyhN-f2Pcyohf'
    end
    
    private 

    def perform(endpoint = '', options = { format: :plain })
      response = self.class.get(endpoint, options.merge(query: { app_key: app_key }))
      JSON.parse(response, symbolize_names: true)[:response]
    end

    def zype_api_base_uri
      @zype_api_uri = 'https://api.zype.com'
    end

    def default_headers
      @default_headers ||= {
        'Content-Type' => 'application/json',
        'Accept' => 'application/json',
      }
    end
  end
end