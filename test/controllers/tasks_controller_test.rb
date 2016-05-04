require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { task_date_completed: @task.task_date_completed, task_description: @task.task_description, task_due_date: @task.task_due_date, task_id: @task.task_id, task_name: @task.task_name, task_status: @task.task_status, task_user: @task.task_user }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { task_date_completed: @task.task_date_completed, task_description: @task.task_description, task_due_date: @task.task_due_date, task_id: @task.task_id, task_name: @task.task_name, task_status: @task.task_status, task_user: @task.task_user }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
