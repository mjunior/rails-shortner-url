require 'digest'

class CreateShortUrlService
  ALPHABET="weCohdfi9ytGaqkNsUcW0QvnSrlRuJZB4zKIMpmV1D5gLbXTE7FHAj8Y3PO2x6"
  MIN_SHORT_SIZE = 5
  
  def initialize(url_id)
    @url_id = url_id
  end
  
  def call
    encode_from_id(@url_id)
  end

  private 

  def encode_from_id(i)
    return ALPHABET[0] if i == 0
    s = ''
    base = ALPHABET.length
    while i > 0
      s << ALPHABET[i.modulo(base)]
      i /= base
    end

    if s.size < 5
      limit = MIN_SHORT_SIZE - s.size
      "#{s.reverse}#{SecureRandom.uuid[0..limit]}"
    else
      s.reverse
    end
  end
end