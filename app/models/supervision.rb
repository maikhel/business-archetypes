# frozen_string_literal: true

class Supervision < ApplicationRecord
  belongs_to :supervisor, class_name: 'Person'
  belongs_to :subordinate, class_name: 'Person'
  belongs_to :project
end
