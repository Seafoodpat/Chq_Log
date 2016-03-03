require 'test_helper'

class LogsControllerTest < ActionController::TestCase
  setup do
    @log = logs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:logs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create log" do
    assert_difference('Log.count') do
      post :create, log: { amount: @log.amount, category: @log.category, chq_date: @log.chq_date, chq_number: @log.chq_number, currencies: @log.currencies, deal_id: @log.deal_id, particular: @log.particular, prepared: @log.prepared, present_date: @log.present_date, sign_date: @log.sign_date, status: @log.status }
    end

    assert_redirected_to log_path(assigns(:log))
  end

  test "should show log" do
    get :show, id: @log
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @log
    assert_response :success
  end

  test "should update log" do
    patch :update, id: @log, log: { amount: @log.amount, category: @log.category, chq_date: @log.chq_date, chq_number: @log.chq_number, currencies: @log.currencies, deal_id: @log.deal_id, particular: @log.particular, prepared: @log.prepared, present_date: @log.present_date, sign_date: @log.sign_date, status: @log.status }
    assert_redirected_to log_path(assigns(:log))
  end

  test "should destroy log" do
    assert_difference('Log.count', -1) do
      delete :destroy, id: @log
    end

    assert_redirected_to logs_path
  end
end