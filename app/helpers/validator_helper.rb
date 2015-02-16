module ValidatorHelper
  def validate_sites_urls
    is_valid = true
    regexp = /^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}$/

    self.sites.each do |url|
      errors.add(:sites, "Invalid url: #{url}") if !url.blank? and !regexp.match(url)
      is_valid = false
    end

    is_valid
  end
end
