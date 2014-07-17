class SprintsController < ApplicationController
  # GET /sprints
  # GET /sprints.json
  before_filter :load_project

  def index
    @sprints = Sprints.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sprints }
    end
  end

  # GET /sprints/1
  # GET /sprints/1.json
  def show
    @sprint = @project.sprints.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sprint }
    end
  end

  # GET /sprints/new
  # GET /sprints/new.json
  def new
    @sprint = Sprint.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sprint }
    end
  end

  # GET /sprints/1/edit
  def edit
    @sprint = @project.sprints.find(params[:id])
  end

  # POST /sprints
  # POST /sprints.json
  def create
    @sprint = @project.sprints.new(params[:sprint])

    respond_to do |format|
      if @sprint.save
        format.html { redirect_to client_project_path(@project.client,@project), notice: 'Sprint was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /sprints/1
  # PUT /sprints/1.json
  def update
    @sprint = @project.sprints.find(params[:id])

    respond_to do |format|
      if @sprint.update_attributes(params[:sprint])
        format.html { redirect_to client_project_path(@project.client,@project), notice: 'Sprint was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /sprints/1
  # DELETE /sprints/1.json
  def destroy
    @sprint = @project.sprints.find(params[:id])
    @sprint.destroy

    respond_to do |format|
      format.html { redirect_to sprints_url }
    end
  end
  
    protected  
  def load_project
    @project=Project.find(params[:project_id])
  end 

end
