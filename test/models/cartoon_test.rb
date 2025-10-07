require "test_helper"

class CartoonTest < ActiveSupport::TestCase
  test "フィクスチャのタイトルが正しいこと" do
    cartoon = cartoons(:cartoon_one)
    assert_equal "ドラえもん", cartoon.title
  end

  test "フィクスチャの著者が正しいこと" do
    cartoon = cartoons(:cartoon_two)
    assert_equal "尾田栄一郎", cartoon.author
  end

  test "フィクスチャの説明が正しいこと" do
    cartoon = cartoons(:cartoon_three)
    assert_equal "忍者の成長物語", cartoon.description
  end

  test "タイトル、著者、説明があれば有効であること" do
    cartoon = cartoons(:cartoon_one)
    assert cartoon.valid?
  end

  test "タイトルがなければ無効であること" do
    cartoon = Cartoon.new(title: nil, author: "Author", description: "Desc")
    assert_not cartoon.valid?
    assert_includes cartoon.errors[:title], "can't be blank"
  end

  test "著者がなければ無効であること" do
    cartoon = Cartoon.new(title: "Title", author: nil, description: "Desc")
    assert_not cartoon.valid?
    assert_includes cartoon.errors[:author], "can't be blank"
  end

  test "説明がなければ無効であること" do
    cartoon = Cartoon.new(title: "Title", author: "Author", description: nil)
    assert_not cartoon.valid?
    assert_includes cartoon.errors[:description], "can't be blank"
  end
end
