require "test_helper"

class Api::TasksControllerTest < ActionDispatch::IntegrationTest
  test "lists stored tasks" do
    get api_tasks_url

    assert_response :success
    ids = response.parsed_body.map { |task| task.fetch("id") }
    assert_includes ids, tasks(:one).id
  end

  test "returns a pending image assigned to the task" do
    get next_image_api_task_url(tasks(:one))

    assert_response :success
    assert_equal images(:one).id, response.parsed_body.fetch("id")
  end

  test "reports when the task has no pending image" do
    images(:one).update!(status: "complete")

    get next_image_api_task_url(tasks(:one))

    assert_response :success
    assert_equal "No hay imágenes pendientes", response.parsed_body.fetch("message")
  end
end
