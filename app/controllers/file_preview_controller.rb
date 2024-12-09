class FilePreviewController < ApplicationController
  before_action :set_demo1

  def show
    # Ensure the file exists
    if @demo1.file.attached?
      # Depending on the file type, you might serve it differently
      send_file_preview(@demo1.file)
    else
      redirect_to @demo1, alert: "No file uploaded"
    end
  end

  private

  # Set the demo1 instance based on the ID from params
  def set_demo1
    @demo1 = Demo1.find(params[:id])
  end

  # Method to preview or send the file based on its type
  def send_file_preview(file)
    case file.content_type
    when /^image\// # If the file is an image
      send_data file.download, type: file.content_type, disposition: 'inline'
    when "application/pdf" # If it's a PDF file
      send_data file.download, type: file.content_type, disposition: 'inline'
    else
      send_data file.download, filename: file.filename.to_s, type: file.content_type, disposition: 'attachment'
    end
  end
end
