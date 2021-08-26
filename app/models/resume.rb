# frozen_string_literal: true

class Resume < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true

  # BEGIN
  has_many :educations, inverse_of: :resume, class_name: 'ResumeEducation', dependent: :destroy
  has_many :works, inverse_of: :resume, class_name: 'ResumeWork', dependent: :destroy

  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :works, reject_if: :all_blank, allow_destroy: true
  # END
end
