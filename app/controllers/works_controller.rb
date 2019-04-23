class WorksController < ApplicationController
  def index
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")
    @albums = Work.where(category: "album")
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    success = @work.save

    if success
      flash[:status] = :success
      flash[:message] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to works_path
    else
      flash.now[:status] = :error
      flash.now[:message] = "Could not create #{@work.category}"
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find_by(id: params[:id])

    unless @work
      flash[:status] = :warning
      flash[:message] = "No work found for ID #{params[:id]}"
      redirect_to root_path
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])

    unless @work
      flash[:status] = :warning
      flash[:message] = "No work found for ID #{params[:id]}"
      redirect_to root_path
    end
  end

  def update
    @work = Work.find_by(id: params[:id])

    unless @work
      flash[:status] = :warning
      flash[:message] = "No work found for ID #{params[:id]}"
      redirect_to root_path
    end

    if @work.update(work_params)
      flash[:status] = :success
      flash[:message] = "Successfully updated #{@work.category} #{@work.id}"
      redirect_to work_path(@work)
    else
      flash.now[:status] = :warning
      flash.now[:message] = "Could not update #{@work.category} #{@work.id}"
      render :edit
    end
  end

  private

  def work_params
    return params.require(:work).permit(:title, :creator, :category, :publication_year, :description)
  end
end
