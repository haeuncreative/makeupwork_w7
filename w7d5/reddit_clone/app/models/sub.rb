# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  title        :string           not null
#  description  :string
#  moderator_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, null: false
    
    has_many :posts,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Post,
        dependent: :destroy

    belongs_to :moderator,
        primary_key: :id,
        foreign_key: :moderator_id,
        class_name: :User,

end
