module AmazonAdvertisingApiRuby
  class Report < BaseRequest

    def self.create(params = {}, opts = {})
      raise ArgumentError.new("params hash must contain a recordType") unless params["recordType"]
      send_request("/v1/#{params.delete("recordType")}/report", "post", params)
    end

    def self.status(report_id, opts = {})
      send_request("/v1/reports/#{report_id}")
    end

    def self.download(location, opts = {})
      opts.merge!({:full_path => true, :gzip => true})
      response_body = send_request(location, "get", nil, opts)
      dir = "public/reports/"
      local_dir = FileUtils.mkdir_p(dir)
      file_path = dir + opts[:recordType] + "-" + Date.today.to_s + ".json.gz"

      File.open(file_path, 'wb') do |file|
        file << response_body
      end
      file_path
    end

  end
end

