module Api
  class BaseController < ApplicationController
  	skip_before_action :verify_authenticity_token, if: -> { request.format.json? }
  end
end