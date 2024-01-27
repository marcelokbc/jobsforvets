class ApplicationController < ActionController::Base
    def render_turbo_flash
        turbo_stream.update("flash", partial: "shared/flashes")
      end
end
