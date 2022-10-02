# frozen_string_literal: true

class UserSerializer < ActiveModel::Serializer
  attributes :created_at, :updated_at, :email
end
