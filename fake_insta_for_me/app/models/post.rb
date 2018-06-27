class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  ## 검증 관련 코드(model validataion)
  #default
  #validates :title, presence: true
  #validates :content, presence: true

  #customize
  validates :title, presence: {message: "제목을 입력하세용"},length: {maximum: 30,too_long: "제목은 %{count}이내로 입력해 주세요"}
  validates :content, presence: {message: "내용을 입력하세용"}

end
