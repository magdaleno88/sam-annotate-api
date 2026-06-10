class Api::AnnotationsController < ApplicationController


def create


annotation = Annotation.create(

user_id:1,

image_id:params[:image_id],

classification_class_id:
params[:classification_class_id],

notes:params[:notes]

)


render json: annotation


end


end