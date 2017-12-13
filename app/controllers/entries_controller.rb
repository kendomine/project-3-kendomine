class EntriesController < ApplicationController
 before_action :entry_params_id, only: [:update, :show, :edit, :destroy]
  before_action :authentication


  def index
    if current_user.profile == nil
      flash[:error] = "You have a empty profile please update it"
    end
    @entries = current_user.entries.all.sort_by {|entry| entry[:date]}
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new(entry_params)
    if current_user.entries << @entry
      flash[:success] = "Diary entry submitted!"
      redirect_to dashboard_path
    else
      flash[:error] = @entry.errors.full_messages[0]
      redirect_to companies_path
    end
  end

  # def show
  #   if @company.contact1 == nil || @company.contact2 == nil || @company.contact3 == nil
  #     flash[:error] = "Contacts missing for #{@company.company_name}"
  #   end
  # end

  def chart
    @entry = Company.where("user_id = #{current_user.id}")
    respond_to do |format|
      format.json {render :json => @entry}
    end
  end

  def edit
  end

  def update
    if @entry.update(entry_params)
      flash[:success] = "#{@entry.day} status updated"
      respond_to do |format|
        format.html{redirect_to dashboard_path}
        format.json {render :json =>@company}
      end
    else
      flash[:error] = "Update failed please try again"
      redirect_to edit_company_path
    end
  end

  def destroy
    if @company.destroy
      flash[:success] = "#{@entry.entry_name} has been deleted from your list"
      redirect_to dashboard_path
    else
      flash[:error] = "Delete failed please try again"
      redirect_to entry_path
    end
  end
end
