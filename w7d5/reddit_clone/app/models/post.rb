# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  sub_id     :bigint           not null
#  author_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Post < ApplicationRecord
    validates :title, null: false
    validates :sub_id, null: false

    belongs_to :sub,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :Sub

    belongs_to :author,
        primary_key: :id,
        foreign_key: :author_id,
        class_name: :User


end
