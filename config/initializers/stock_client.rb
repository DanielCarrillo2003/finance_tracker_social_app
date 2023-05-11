require 'httparty'

class StockClient
  def self.price(symbol)
    response = HTTParty.get("https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=#{symbol}&apikey=3CQCG2QX195FM8KA")
    if response.code == 200 && response.parsed_response['Global Quote']
      response.parsed_response['Global Quote']['05. price']
    else
      nil
    end
  end
end