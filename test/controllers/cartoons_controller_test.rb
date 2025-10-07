require "test_helper"

class CartoonsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    @cartoon = cartoons(:cartoon_one)
  end

  test 'cartoonを１つ表示すること' do
    get "/cartoons/#{@cartoon.id}"
    assert_response :success
  end

  test 'newテンプレートをrenderすること' do
    get "/cartoons/new"
    assert_response :success
  end

  test 'cartoonを作成できること' do
    assert_difference('Cartoon.count') do
      post "/cartoons", params: { cartoon: { title: "進撃の巨人", author: "諫山創", description: "巨人との戦いの物語" } }
    end
    assert_equal "１レコード追加しました", flash[:notice]
    assert_redirected_to cartoon_path(Cartoon.last)
  end

  test '無効なパラメータではcartoonを作成できないこと' do
    assert_no_difference('Cartoon.count') do
      post "/cartoons", params: { cartoon: { title: "", author: "", description: "" } }
    end
    assert_equal "追加に失敗しました", flash[:alert]
    # Rails 8では422を返す仕様
    assert_response :unprocessable_content
  end

  test "editテンプレートをrenderすること" do
    get "/cartoons/#{@cartoon.id}/edit"
    assert_response :success
  end

  test "cartoonを更新できること" do
    patch "/cartoons/#{@cartoon.id}", params: { cartoon: { title: "更新タイトル", description: "更新説明" } }
    assert_equal "１レコード更新しました", flash[:notice]
    assert_redirected_to cartoon_path(@cartoon)
  end

  test "無効なパラメータではcartoonを更新できないこと" do
    patch "/cartoons/#{@cartoon.id}", params: { cartoon: { title: "", description: "" } }
    assert_equal "更新に失敗しました", flash[:alert]
    assert_response :unprocessable_content
  end

  
  test "cartoonを削除できること" do
    assert_difference('Cartoon.count', -1) do
      delete "/cartoons/#{@cartoon.id}"
    end
    assert_equal "１レコード削除しました", flash[:notice]
    assert_redirected_to cartoons_path
  end
end
