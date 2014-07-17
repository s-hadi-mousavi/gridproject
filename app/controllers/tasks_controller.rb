class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  before_filter :load_sprint, :except => :index

  def index
    @search = Task.search(params[:search])
    @tasks = @search.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = @sprint.tasks.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
  @task = Task.new
  @developers = Developer.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = @sprint.tasks.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = @sprint.tasks.new(params[:task])
    @task = Task.build
    @task.assignments.build

    respond_to do |format|
      if @task.save
        @sprint.status = nil
        @sprint.save
        format.html { redirect_to project_sprint_path(@sprint.project_id,@sprint), notice: 'Task was successfully created.' }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = @sprint.tasks.find(params[:id])
    @activetasks = @sprint.tasks.where(:status => nil)
    respond_to do |format|
      if @task.update_attributes(params[:task])
        if @activetasks.size == 0
          @sprint.status = 1
          @sprint.save
        end
        if @sprint.status == 0       
          format.html { redirect_to tasks_path , notice: 'Task was successfully updated.' }
        else
          format.html { redirect_to tasks_path , notice: 'Task was successfully updated and Sprint is finished.' }
        end

          #project_sprint_path(@sprint.project_id,@sprint)        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = @sprint.tasks.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end
    
  protected  
  def load_sprint
    @sprint=Sprint.find(params[:sprint_id])
  end 

end
