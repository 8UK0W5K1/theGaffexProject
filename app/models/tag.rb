class Tag < ApplicationRecord
belongs_to :user, index: true
belongs_to :article, index: true

end
