# frozen_string_literal: true

class Ui::AvatarComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
