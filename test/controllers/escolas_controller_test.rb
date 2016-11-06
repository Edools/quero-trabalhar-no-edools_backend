require 'test_helper'

class EscolasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escola = escolas(:one)
  end

  test "should get index" do
    get escolas_url
    assert_response :success
  end

  test "should get new" do
    get new_escola_url
    assert_response :success
  end

  test "should create escola" do
    assert_difference('Escola.count') do
      post escolas_url, params: { escola: { data: @escola.data, email: @escola.email, nome: @escola.nome, pitch: @escola.pitch, subdominio: @escola.subdominio } }
    end

    assert_redirected_to escola_url(Escola.last)
  end

  test "should show escola" do
    get escola_url(@escola)
    assert_response :success
  end

  test "should get edit" do
    get edit_escola_url(@escola)
    assert_response :success
  end

  test "should update escola" do
    patch escola_url(@escola), params: { escola: { data: @escola.data, email: @escola.email, nome: @escola.nome, pitch: @escola.pitch, subdominio: @escola.subdominio } }
    assert_redirected_to escola_url(@escola)
  end

  test "should destroy escola" do
    assert_difference('Escola.count', -1) do
      delete escola_url(@escola)
    end

    assert_redirected_to escolas_url
  end
end
