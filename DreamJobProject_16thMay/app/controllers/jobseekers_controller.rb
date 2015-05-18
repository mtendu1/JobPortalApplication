class JobseekersController < ApplicationController
  before_action :set_jobseeker, only: [:show, :edit, :update, :destroy]

  # GET /jobseekers
  # GET /jobseekers.json
  def index
    @jobseekers = Jobseeker.where(user_id: current_user)
    job_title=params[:job_title]
    search=params[:search]

    if job_title == ""
      @jobs= Job.all

    elsif search
      @jobs = Job.search(search)

    else
      @jobs = Job.where("job_title= '#{job_title}'")
    end



  end

  # GET /jobseekers/1
  # GET /jobseekers/1.json
  def show
  end

  def applyjob

    #byebug
    jobId = Job.find(params[:job_id])

    #appliedjob = Appliedjob.new(appliedjob_params)
    @appliedjob = Appliedjob.new()

    jobseeker= Jobseeker.where(user_id: current_user).pluck(:id)[0]

    @appliedjob.jobseeker_id= jobseeker

    #job = Job.where(id:10).pluck(:id)[0]
    @appliedjob.job_id = jobId.id

    respond_to do |format|
      if @appliedjob.save
        format.html { redirect_to jobseekers_url, notice: 'Job Applied successfully.' }
        format.json { render :show, status: :created, location: jobseekers_url }
      else
        format.html { render :new }
        format.json { render json: @appliedjob.errors, status: :unprocessable_entity }
      end
    end

  end
  # GET /jobseekers/new
  def new
    @jobseeker = Jobseeker.new
  end

  # GET /jobseekers/1/edit
  def edit
  end

  # POST /jobseekers
  # POST /jobseekers.json
  def create
    @jobseeker = Jobseeker.new(jobseeker_params)
    user = User.find(current_user)
    @jobseeker.user=user

    respond_to do |format|
      if @jobseeker.save
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully created.' }
        format.json { render :show, status: :created, location: @jobseeker }
      else
        format.html { render :new }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobseekers/1
  # PATCH/PUT /jobseekers/1.json
  def update
    respond_to do |format|
      if @jobseeker.update(jobseeker_params)
        format.html { redirect_to @jobseeker, notice: 'Jobseeker was successfully updated.' }
        format.json { render :show, status: :ok, location: @jobseeker }
      else
        format.html { render :edit }
        format.json { render json: @jobseeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobseekers/1
  # DELETE /jobseekers/1.json
  def destroy
    @jobseeker.destroy
    respond_to do |format|
      format.html { redirect_to jobseekers_url, notice: 'Jobseeker was successfully destroyed.' }
      format.json { head :no_content }
    end
end
    def search
      @jobs= Job.all
      job_title=params[:job_title]
      search=params[:search]

      if job_title == "ALL"
        @jobs= Job.all

      elsif search
        @jobs = Job.search(search)

      else
        @jobs = Job.where("job_title= '#{job_title}'")
      end
    end

    def viewappliedjobs

      jobseeker= Jobseeker.where(user_id: current_user).pluck(:id)[0]
      @appliedjobs = Appliedjob.where(jobseeker_id: jobseeker)

      #jobs = Job.find_by_sql(select jobs.* from jobs, appliedjobs where jobs.id =job_id )

     #Job.find_by_sql(select job_title from jobs where
      #{job_id.in Appliedjob.select(job_id from Appliedjob.where(job_id.@appliedjob)}
     #Job.joins(:appliedjobs).where('appliedjobs.job_id' => 10)

    end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jobseeker
      @jobseeker = Jobseeker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jobseeker_params

      params.require(:jobseeker).permit(:name, :phone, :address, :attach)
    end

  def set_appliedjob
    @appliedjob = Appliedjob.find(params[:id])
  end

  def appliedjob_params

    params.require(:jobseeker).permit(:job_id)
  end

  end

