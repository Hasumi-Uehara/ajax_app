class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: "DESC")
  end

  def create
    Post.create(content: params[:content], checked: false)
    render json:{ post: post }
    # 7行目は、checked:カラムにfalse(＝まだ既読になっていない)を、content:カラムにparams[:content])を保存する。
    # 8行目は、json形式でchecked.jsにデータ(変数post)を返却してる。
  end

  def checked
    post = Post.find(params[:id])
    if post.checked
      post.update(checked: false)
    else
      post.update(checked: true)
    end

    item = Post.find(params[:id])
    render json: { post: item }
    # 19行目でPost.find(params[:id])を代入したitemを、json形式でpostに出力する。
  end
end