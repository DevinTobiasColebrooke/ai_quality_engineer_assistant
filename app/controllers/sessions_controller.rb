class SessionsController < ApplicationController
  def index
    @sessions = Session.all.order(created_at: :desc)
  end

  def show
    @session = Session.find(params[:id])
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)
    @session.status = "active"

    if @session.save
      redirect_to @session, notice: "Session created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @session = Session.find(params[:id])
    @session.destroy
    redirect_to sessions_path, notice: "Session ended."
  end

  def run_test
    @session = Session.find(params[:id])
    PlaywrightRunnerService.new(@session).call
    redirect_to @session, notice: "Test agent started."
  end

  private

  def session_params
    params.require(:session).permit(:name, :url, :agent)
  end
end
