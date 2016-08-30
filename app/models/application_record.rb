class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def pence_to_pounds(total)
    return '0.00' if total == 0
    total.to_s[0..-3] + '.' + total.to_s[-2..-1]
  end

end
