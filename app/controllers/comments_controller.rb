class CommentsController < ApplicationController
	before_action :set_comment, only: [:destroy]
  def create
  	@company = Company.find(params[:company_id])
  	@comment = @company.comments.build(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @company, notice: 'Complaint was successfully created.' }
        format.json { render :show, status: :created, location: @company }
        format.js
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  def destroy
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:complaint, :company_id)
    end
end
end
