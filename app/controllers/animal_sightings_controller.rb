class AnimalSightingsController < ApplicationController
    def index
        animals = AnimalSighting.all
        render json: animals
    end
    def show
        animal = AnimalSighting.find(params[:id])
        render json: animal
    end
    def create
        animal = AnimalSighting.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end
    def update
        animal = AnimalSighting.find(params[:id])
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end

    end
    def destroy
        animal = AnimalSighting.destroy(params[:id])
        if animal.destroy
            render json: animal
        else
            render json: animal.errors
        end
    end
    private
    def animal_params
        params.require(:animal_sighting).permit(:common_name, :scientific_binomial)
    end
end
