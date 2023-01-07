class GithubInfosController < ApplicationController
  before_action :authorize
  before_action :set_github_info, only: %i[ show update destroy ]

  # GET /github_infos
  def index
    @github_infos = @user.github_infos.all

    render json: @github_infos
  end

  # GET /github_infos/1
  def show
    render json: @github_info
  end

  # POST /github_infos
  def create
    @github_info = GithubInfo.new(github_info_params.merge(user: @user))

    if @github_info.save
      render json: @github_info, status: :created, location: @github_info
    else
      render json: @github_info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /github_infos/1
  def update
    if @github_info.update(github_info_params)
      render json: @github_info
    else
      render json: @github_info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /github_infos/1
  def destroy
    @github_info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_github_info
      @github_info = GithubInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def github_info_params
      params.require(:github_info).permit(:repository_route, :github_token)
    end
end
