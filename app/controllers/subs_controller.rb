class SubsController < ApplicationController

  before_filter :user_is_mod?, only: :destroy

  def index
    @subs = Sub.all
    render :index
  end

  def new
    @sub = Sub.new
    render :new
  end

  def create
    @sub = Sub.new(params[:sub])
    @sub.user_id = current_user.id
    # params[:links]["0"][:user_id] = current_user.id
    @sub.links.new(filter_blanks(params[:links].values))
    #@sub = current_user.subs.build(params[:sub])
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def destroy
    if @sub.destroy
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      redirect_to sub_url(@sub)
    end
  end

  private

  def filter_blanks(entry)
    entry.reject { |hasher| hasher.values.include?("") }
  end

  def user_is_mod?
    @sub.user_id == current_user.id
  end
end
