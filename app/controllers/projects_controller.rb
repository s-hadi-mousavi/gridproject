class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  before_filter :load_client, :except => :index

  def index
    @search = Project.search(params[:search])
    @projects = @search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = @client.projects.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = @client.projects.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = @client.projects.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @client, notice: 'Project was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = @client.projects.find(params[:id])
    
    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to client_project_path(@project.client_id,@project), notice: 'Project was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = @client.projects.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to @client }
    end
  end

  protected  
  def load_client
    @client=Client.find(params[:client_id])
  end 


end
