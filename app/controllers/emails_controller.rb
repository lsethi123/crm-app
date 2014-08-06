class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]

  # GET /emails
  # GET /emails.json
  def index
    @customer = Customer.select("id,name").find(params['customer_id'])
    @contacts = Contact.all.where(customer_id:@customer.id)
    @emails = Email.all.order(updated_at: :desc).where(customer_id:@customer.id)
    @notes = Note.all.order(updated_at: :desc).where(customer_id:@customer.id)
  end

  # GET /emails/1
  # GET /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @customer_id = params[:customer_id]
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
    @customer_id = @email.customer_id
  end

  # POST /emails
  # POST /emails.json
  def create
    @email = Email.new(email_params)
    @email.contact_id = params['contact_id']
    respond_to do |format|
      if @email.save
        CrmMailer.send_contact_mail(@email).deliver
        format.html { redirect_to customers_url, notice: 'Email was successfully created.' }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1
  # PATCH/PUT /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        pp email_params
        puts"after"
        pp @email
        format.html { redirect_to emails_url(customer_id:@email.customer_id), notice: 'Email was successfully updated.' }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1
  # DELETE /emails/1.json
  def destroy
    @email.destroy
    respond_to do |format|
      format.html { redirect_to emails_url(customer_id:@email.customer_id), notice: 'Email was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  def contacts_by_customer
    if params[:id].present?
      @contacts = Customer.find(params[:id]).contacts
    else
      @contacts = []
    end
    respond_to do |format|
      format.html
      format.json { render json: @contacts ,"success" => "true"}
    end
    
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      @email = Email.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def email_params
      params.require(:email).permit(:email,:customer_id,:subject,:message,:contact_id,:user_id)
    end
end
