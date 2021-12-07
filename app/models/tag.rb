class Tag < ApplicationRecord
t.belongs_to :user, index: true
t.belongs_to :article, index: true

end
