require_relative '../config/environment'

class Property < ActiveRecord::Base

  validates :title, presence: true

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Invalid e-mail fromat" }, allow_nil: true, allow_blank: false

  validates :phone_number, format: { with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "Invalid Phone format" }, allow_nil: true, allow_blank: false

  validates :max_guests, :numericality => { only_integer: true, greater_than: 0 }, allow_nil: true, allow_blank: false

  validates :nightly_rate_in_eur, :numericality => { greater_than_or_equal_to: 0 }, allow_nil: true, allow_blank: false

  validate :validate_property_type_value

  before_save :check_complete

  scope :completed, -> { where(completed: true) }

  def self.input_required_except
    %w{id created_at updated_at completed}
  end

  def self.pre_defined_property_types
    ["holiday home", "apartment", "private room"]
  end

  def required_attributes(bSkipFilled = false)
    except ||= Property.input_required_except
    self.attributes.reject {|attr, value| except.include?(attr) or (bSkipFilled and !value.blank?)}
  end

  def check_complete
    nil_count = 0
    self.required_attributes.each{|key, val|
      nil_count +=1 if val.blank?
    }
    self.completed = true if nil_count.zero?
  end

  def validate_property_type_value
    if ((!Property.pre_defined_property_types.include?(self.property_type) and !self.property_type.blank?) or (self.property_type == ""))
      errors.add(:property_type, "Property Type can only be 'holiday home', 'apartment', 'private room' ")
    end
  end

end