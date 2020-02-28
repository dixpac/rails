# frozen_string_literal: true

require "cases/helper"

require "models/person"

class EmailValidationTest < ActiveModel::TestCase
  def teardown
    Person.clear_validators!
  end

  def test_validate_email
    Person.validates_email_of(:email)

    t = Person.new(email: "invalid@email")
    assert t.invalid?, "Shouldn't be valid"
    assert_equal ["is not an email"], t.errors[:email]

    t.email = "valid@example.org"

    assert_predicate t, :valid?
    assert_empty t.errors[:email]
  end
end
