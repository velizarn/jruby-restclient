require 'java'

require 'vendor/commons-codec-1.6.jar'
require 'vendor/commons-logging-1.1.1.jar'
require 'vendor/json-simple-1.1.1.jar'

java_import java.net.URLConnection
java_import java.io.DataOutputStream
java_import org.apache.commons.codec.binary.Base64
java_import org.json.simple.parser.JSONParser

module HTTP

  class RestClient

    def initialize(address)
      @conn = java.net.URL.new(address).openConnection()
      @response_content = ''
    end

    def set_header(property, value)
      @conn.setRequestProperty(property, value)
    end

    def auth(username, password, type='Basic')
      input = username+":"+password
      authEncBytes = Base64.encodeBase64(input.to_java_bytes)
      authString = java.lang.String.new(authEncBytes).to_s
      @conn.setRequestProperty("Authorization", type+" "+authString)
    end

    alias_method :setHeader, :set_header

    def get()
      @conn.setRequestMethod('GET')
    end

    def post(urlParameters=nil)
      @conn.setRequestMethod('POST')
      if urlParameters != nil then
        @conn.setRequestProperty("Content-Length", ""+urlParameters.to_java_bytes.length.to_s)
        @conn.setUseCaches(false)
        @conn.setDoInput(true)
        @conn.setDoOutput(true)
        wr = DataOutputStream.new(@conn.getOutputStream())
        wr.writeBytes(urlParameters)
        wr.flush()
        wr.close()
      end
    end

    def put()
      @conn.setRequestMethod('PUT')
    end

    def delete()
      @conn.setRequestMethod('DELETE')
    end

    def head()
      @conn.setRequestMethod('HEAD')
    end

    def options()
      @conn.setRequestMethod('OPTIONS')
    end

    def trace()
      @conn.setRequestMethod('TRACE')
    end

    def get_response_code()
      return @conn.getResponseCode()
    end

    def get_header(propertyName)
      return @conn.getHeaderField(propertyName)
    end

    def get_headers()
      mapResponse = @conn.getHeaderFields()
      setHeaders = mapResponse.entrySet()
      iterator = mapResponse.keySet().iterator()

      arr = Array.new
      header = Struct.new(:property, :value)

      while iterator.hasNext() do
        stringKey = iterator.next()
        next if stringKey.nil? || stringKey.empty?
        arr.push header.new(stringKey, self.get_header(stringKey))
      end

      return arr
    end

    def to_io()
      return @conn.getInputStream()
    end

    def to_s()

      return @response_content if @response_content != ''

      ios = @conn.getInputStream()
      @response_content = ''

      ios.to_io.each {|line|
        @response_content << line
      }

      return @response_content
    end

    alias_method :toString, :to_s

    def to_json

      content = self.to_s()

      parser = JSONParser.new

      return parser.parse(content)
    end

    alias_method :json, :to_json

    def disconnect
      # Close the input stream and releases any system resources associated with the stream.
      @conn.getInputStream().close()
      @conn.disconnect()
    end

  end

end