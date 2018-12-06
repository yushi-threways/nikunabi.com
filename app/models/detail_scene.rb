class DetailScene < ApplicationRecord
  belongs_to :detail, optional: true
  belongs_to :scene, optional: true
end
