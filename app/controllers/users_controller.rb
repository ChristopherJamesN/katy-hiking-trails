class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      if user.valid? && user.save
        token = Knock::AuthToken.new(payload: { sub: user.id })
        render json: token, status: :created
      else
        render json: { errors: user.errors.full_messages }, status: 500
      end
    end
  end
end
