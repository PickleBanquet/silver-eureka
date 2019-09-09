class BadWordValidator < ActiveModel::Validator
  def validate(record)
    Rails.logger.info "#{record.saying}"
    if record.saying == "ass"
      Rails.logger.info "I'm also here!"
      record.errors[:base] << "You used a bad word!"
      Rails.logger.info "I'm really here!"
    end
  end
end

class Quote < ApplicationRecord
  validates :saying, presence: true, length: { maximum: 140, minimum: 3}
  validates :author, presence: true, length: { maximum: 50, minimum: 3}
  validates_with BadWordValidator
end