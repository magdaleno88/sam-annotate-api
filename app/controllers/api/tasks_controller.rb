class Api::TasksController < ApplicationController


def index

render json: Task.all

end



def show

task = Task.find(params[:id])

render json: task

end



def next_image


task = Task.find(params[:id])


image = task.images
.where(status:"pending")
.first


if image

render json:image

else

render json:{
message:"No hay imágenes pendientes"
}

end


end



end