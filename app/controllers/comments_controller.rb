class CommentsController < ApplicationController
  def create
     @product = Product.find(params[:product_id])
     @comment = current_user.comments.new(comment_params)
     if @comment.save
      ActionCable.server.broadcast 'comments',comment: render_comment
     else
      flash[:notice]=@comment.error.full_messages.to_sentence
     end
  end
  def render_comment
    CommentsController.renderer.instance_variable_set(:@env, {"HTTP_HOST"=>"localhost:3000", 
      "HTTPS"=>"off", 
      "REQUEST_METHOD"=>"GET", 
      "SCRIPT_NAME"=>"",   
      "warden" => warden})
    CommentsController.render(
      partial: 'comments/comment',
      locals: {
        comment: @comment
      }
    )
  end
  private
    def comment_params
      params
      .require(:comment)
      .permit(:body, :parent_id, :image)
      .merge(product_id: params[:product_id])
    end
end
