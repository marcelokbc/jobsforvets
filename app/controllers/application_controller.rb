class ApplicationController < ActionController::Base
  include Pagy::Backend
  
    def render_turbo_flash
        turbo_stream.update("flash", partial: "shared/flashes")
      end
end
