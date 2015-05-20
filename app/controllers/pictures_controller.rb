class PicturesController < ApplicationController

  def new
  end

  def create
    @image = picture_filename
    File.open(upload_path, "wb" ) {|f| f.write(params[:picture].read)}
  end

private
  def upload_path
    "#{Rails.root}/app/assets/images/#{picture_filename}"
  end

  def picture_filename
    params[:picture].original_filename
   end

end
