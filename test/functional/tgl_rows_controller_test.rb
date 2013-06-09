require 'test_helper'

class TglRowsControllerTest < ActionController::TestCase
  setup do
    @tgl_row = tgl_rows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tgl_rows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tgl_row" do
    assert_difference('TglRow.count') do
      post :create, tgl_row: { billable: @tgl_row.billable, client: @tgl_row.client, description: @tgl_row.description, email: @tgl_row.email, end_date: @tgl_row.end_date, start_date: @tgl_row.start_date, tags: @tgl_row.tags, task: @tgl_row.task, usd_amount: @tgl_row.usd_amount, user_name: @tgl_row.user_name }
    end

    assert_redirected_to tgl_row_path(assigns(:tgl_row))
  end

  test "should show tgl_row" do
    get :show, id: @tgl_row
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tgl_row
    assert_response :success
  end

  test "should update tgl_row" do
    put :update, id: @tgl_row, tgl_row: { billable: @tgl_row.billable, client: @tgl_row.client, description: @tgl_row.description, email: @tgl_row.email, end_date: @tgl_row.end_date, start_date: @tgl_row.start_date, tags: @tgl_row.tags, task: @tgl_row.task, usd_amount: @tgl_row.usd_amount, user_name: @tgl_row.user_name }
    assert_redirected_to tgl_row_path(assigns(:tgl_row))
  end

  test "should destroy tgl_row" do
    assert_difference('TglRow.count', -1) do
      delete :destroy, id: @tgl_row
    end

    assert_redirected_to tgl_rows_path
  end
end
