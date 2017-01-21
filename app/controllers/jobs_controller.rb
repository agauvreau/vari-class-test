class JobsController < ApplicationController
    before_action :find_job, only: [:show, :edit, :update, :destroy]
    
    
    def index
        @jobs = Job.all
    end
    
    def show
    end
    
    def new
        @job = Job.new
    end
    
    def create
        @job = Job.new(job_params)
        if @job.save
            flash[:success] = "Job was successfully created"
            redirect_to root_path
        else
            render @jobs
        end
    end
    
    def update
        if @job.update(job_params)
            flash[:success] = "Job was successfully updated"
            redirect_to @job
        else
            render 'edit'
        end
        
    end
    
    def destroy
        if @job.destroy
            flash[:success] = "Job was successfully deleted"
            redirect_to root_path
        else
            flash[:danger] = "Job could not be deleted"
            redirect_to edit_job_path
        end
    end
    
    private
    def job_params
        params.require(:job).permit(:inst_name, :repair_type, :user_name, :comment)
    end
    
    def find_job
        @job = Job.find(params[:id])
    end
    
    
    
end
