

# app/controllers/short_urls_controller.rb
class ShortUrlsController < ApplicationController
  def create
    url = ShortUrl.find_or_create_by(original_url: params[:original_url])
    render json: { short_url: "#{request.base_url}/#{url.short_code}" }
  end

  def show
    url = ShortUrl.find_by(short_code: params[:short_code])
    if url
      url.increment!(:clicks)
      redirect_to url.original_url
    else
      render json: { error: 'URL not found' }, status: :not_found
    end
  end
end
