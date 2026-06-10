# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
ClassificationClass.create([
    {
    name:"No DR",
    severity:0
    },

    {
    name:"Mild DR",
    severity:1
    },

    {
    name:"Moderate DR",
    severity:2
    },

    {
    name:"Severe DR",
    severity:3
    },

    {
    name:"Proliferative DR",
    severity:4
    }

])

Task.create(
 name:"Clasificación inicial",
 description:"Revisión de imágenes de fondo de ojo",
 status:"pending"
)