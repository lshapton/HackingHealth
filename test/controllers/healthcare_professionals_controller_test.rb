require 'test_helper'

class HealthcareProfessionalsControllerTest < ActionController::TestCase
  setup do
    @healthcare_professional = healthcare_professionals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:healthcare_professionals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create healthcare_professional" do
    assert_difference('HealthcareProfessional.count') do
      post :create, healthcare_professional: { name: @healthcare_professional.name, role: @healthcare_professional.role }
    end

    assert_redirected_to healthcare_professional_path(assigns(:healthcare_professional))
  end

  test "should show healthcare_professional" do
    get :show, id: @healthcare_professional
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @healthcare_professional
    assert_response :success
  end

  test "should update healthcare_professional" do
    patch :update, id: @healthcare_professional, healthcare_professional: { name: @healthcare_professional.name, role: @healthcare_professional.role }
    assert_redirected_to healthcare_professional_path(assigns(:healthcare_professional))
  end

  test "should destroy healthcare_professional" do
    assert_difference('HealthcareProfessional.count', -1) do
      delete :destroy, id: @healthcare_professional
    end

    assert_redirected_to healthcare_professionals_path
  end
end
