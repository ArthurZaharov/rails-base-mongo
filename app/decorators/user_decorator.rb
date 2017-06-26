class UserDecorator < ApplicationDecorator
  delegate :id, :full_name, :email, :birthday

  def full_name_with_age
    return object.full_name unless age

    "#{object.full_name} (#{age})"
  end

  private

  def age
    return h.birthday_age(object.birthday) if object.birthday
  end
end
