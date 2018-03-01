class User < ActiveRecord::Base
    has_secure_password
    before_save {self.email= email.downcase} #현재 받은거 self.email 을 전부 소문자로 바꿔서 넣는거임
    
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :name, presence: true, length:{maximum: 50}#이름과 이메일은 반드시 존재하고 최대 50자
    validates :email, presence: true, length:{maximum: 255},#255자 안넘게
            format:{with: VALID_EMAIL_REGEX},uniqueness:{case_sensitive:false}
    
end
