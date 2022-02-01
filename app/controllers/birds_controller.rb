class BirdsController < ApplicationController
  wrap_parameters format: []
end
  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  # def create
  #   bird = Bird.create(name: params[:name], species: params[:species])
  #   render json: bird, status: :created
  # end

  # POST / birds -> mass assignment
  # def create
  #   bird = Bird.create(params)
  #   render json: bird, status: :created
  # end

 # POST /birds with strong params
  # def create
  #   bird = Bird.create(params.permit(:name, :species))
  #   render json: bird, status: :created
  # end

   # POST /birds using private
   def create
    bird = Bird.create(bird_params)
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  private
  # all methods below here are private

  def bird_params
    params.permit(:name, :species)
  end

end
