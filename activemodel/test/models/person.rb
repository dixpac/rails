# frozen_string_literal: true

class Person
  include ActiveModel::Validations
  extend  ActiveModel::Translation

  attr_accessor :title, :karma, :salary, :gender, :email

  def initialize(options = {})
    options.each { |name, value| send("#{name}=", value) }
  end

  def condition_is_true
    true
  end

  def condition_is_false
    false
  end
end

class Person::Gender
  extend ActiveModel::Translation
end

class Child < Person
end
