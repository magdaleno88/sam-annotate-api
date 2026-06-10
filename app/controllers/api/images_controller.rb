class Api::ImagesController < ApplicationController


def index

render json: Image.all

end



def create


image = Image.new(

patient_code:
params[:patient_code],

status:"pending"

)



image.file.attach(
params[:file]
)



if image.save

render json:image

else

render json:image.errors

end


end


end