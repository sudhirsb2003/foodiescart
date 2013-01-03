require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  setup do
    @recipe = recipes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recipes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recipe" do
    assert_difference('Recipe.count') do
      post :create, recipe: { author_name: @recipe.author_name, category: @recipe.category, cooking_time: @recipe.cooking_time, difficulty_level: @recipe.difficulty_level, name: @recipe.name, preparation_method: @recipe.preparation_method, user_id: @recipe.user_id }
    end

    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should show recipe" do
    get :show, id: @recipe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recipe
    assert_response :success
  end

  test "should update recipe" do
    put :update, id: @recipe, recipe: { author_name: @recipe.author_name, category: @recipe.category, cooking_time: @recipe.cooking_time, difficulty_level: @recipe.difficulty_level, name: @recipe.name, preparation_method: @recipe.preparation_method, user_id: @recipe.user_id }
    assert_redirected_to recipe_path(assigns(:recipe))
  end

  test "should destroy recipe" do
    assert_difference('Recipe.count', -1) do
      delete :destroy, id: @recipe
    end

    assert_redirected_to recipes_path
  end
end
