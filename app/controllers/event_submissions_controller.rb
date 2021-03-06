class EventSubmissionsController < ApplicationController
  before_action :set_event_submission, only: [:show, :edit, :update, :destroy]
  before_action :set_set_tenant 
  after_action :verify_authorized, except: [:create, :new]
  before_action :admin_only, :except => [:create, :new]
 
  # GET /event_submissions
  # GET /event_submissions.json
  def index
    @event_submissions = EventSubmission.all
    authorize @event_submissions
  end

  # GET /event_submissions/1
  # GET /event_submissions/1.json
  def show
     authorize @event_submission
  end
 
  # GET /event_submissions/new
  def new
 
    @event_submission = EventSubmission.new
     
  end

  # GET /event_submissions/1/edit
  def edit
    authorize @event_submission
  end

  # POST /event_submissions
  # POST /event_submissions.json
  def create
    tenant_email = User.get_tenant_user_email
    tenant = Apartment::Tenant.current
    @event_submission = EventSubmission.new(event_submission_params)

    respond_to do |format|
      if @event_submission.save
        
        #add here the mailers
        EventMailer.event_submission_received(@event_submission, tenant).deliver_now
        EventMailer.event_request(@event_submission, tenant_email).deliver_now
        
        format.html { redirect_to visitors_thank_you_path, notice: 'Your Event Submission was successfully submitted.' }
        format.json { render :show, status: :created, location: @event_submission }
      else
        format.html { render :new }
        format.json { render json: @event_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_submissions/1
  # PATCH/PUT /event_submissions/1.json
  def update
    authorize @event_submission
    respond_to do |format|
      if @event_submission.update(event_submission_params)
        format.html { redirect_to @event_submission, notice: 'Event submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_submission }
      else
        format.html { render :edit }
        format.json { render json: @event_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_submissions/1
  # DELETE /event_submissions/1.json
  def destroy
    authorize @event_submission
    @event_submission.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Event submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_submission
      @event_submission = EventSubmission.find(params[:id])
    end
def admin_only
 
if signed_in?  

  unless current_user.admin?
  redirect_to root_url, :alert => "Access denied."
 

  end
  
else


redirect_to root_url, :alert => "Access denied."  


end  
  
 
 
end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_submission_params
      params.require(:event_submission).permit(:full_name, :event_name,  :taking_place_address, :registration_required_where, :how_to_market, :event_description, :event_date, :start_time, :end_time, :taking_place, :taking_place_where, :registration_required, :last_name, :first_name, :middle_initial, :address, :city, :postal_code, :phone_number, :email_address)
    end
end
