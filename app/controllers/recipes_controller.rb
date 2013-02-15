class RecipesController < ApplicationController
 before_filter :authenticate_user!
  # GET /recipes
  # GET /recipes.json
  def index
    if params[:tag]
      @recipes = Recipe.tagged_with(params[:tag]).page params[:page]
    else
      #@recipes = Recipe.order(:name).page params[:page]
      #@recipes = Recipe.order("name").page(params[:page]).per(5)
      @recipes = Kaminari.paginate_array(Recipe.all).page(params[:page])
      #@recipes = Recipe.all
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    @similar_recipes = Recipe.tagged_with(@recipe.tag_list)
    @comment = Comment.new
    #@comments = Comment.find_all_by_recipe_id(@recipe)
    @comments = Comment.find_all_by_recipe_id(@recipe, :order => 'created_at DESC')
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end
end
