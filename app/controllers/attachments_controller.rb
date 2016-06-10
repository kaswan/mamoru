class AttachmentsController < ApplicationController
  before_action :set_attachment, only: [:show, :edit, :update, :destroy]
    
  def index
    @attachments = Attachment.all
    @attachment = Attachment.new
  end

  def create
    @attachment = Attachment.new(attachment_params)
    @attachment.parent = current_user
    if @attachment.save
      render json: { message: "success", fileID: @attachment.id }, status: 200
    else
      render json: { error: @attachment.errors.full_messages.join(',')}, status: 400
    end
  end
  
  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    if @attachment.destroy    
      render json: { message: "File deleted from server" }
    else
      render json: { message: @attachment.errors.full_messages.join(',') }
    end
  end

  private
  
  def set_attachment
    @attachment = Attachment.find(params[:id])
  end
  def attachment_params
    params.require(:attachment).permit(:upload, :parent_type, :parent_id, :relation_type, :relation_id)
  end
end
