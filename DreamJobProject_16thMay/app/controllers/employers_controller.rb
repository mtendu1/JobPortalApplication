class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy]

  # GET /employers
  # GET /employers.json
  def index
    @employers = Employer.where(user_id: current_user)
  end

  # GET /employers/1
  # GET /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @employer = Employer.new
  end

  # GET /employers/1/edit
  def edit
  end

  # POST /employers
  # POST /employers.json
  def create

    @employer = Employer.new(employer_params)
    user = User.find(current_user)
    @employer.user=user
    respond_to do |format|
      if @employer.save
        format.html { redirect_to @employer, notice: 'Employer was successfully created.' }
        format.json { render :show, status: :created, location: @employer }
      else
        format.html { render :new }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to @employer, notice: 'Employer was successfully updated.' }
        format.json { render :show, status: :ok, location: @employer }
      else
        format.html { render :edit }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    @employer.destroy
    respond_to do |format|
      format.html { redirect_to employers_url, notice: 'Employer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_params
      params.require(:employer).permit(:company_name, :company_phone, :ein, :contact_person_name,:address, :State, :Country, :Industry_type)
    end


end
