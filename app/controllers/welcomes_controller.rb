class WelcomesController < ApplicationController
  before_action :set_welcome, only: [:show, :edit, :update, :destroy]

  # GET /welcomes
  # GET /welcomes.json
  def index

  # require 'sift_email_api'

  # manager = SiftEmailApi.new('c3ddd52d9063651c7797e93dade30230', '14a5f0bb8891fb2df886d85c0509b342b71ecef7')

  # eml_data = File.new('test.eml').read
  # puts manager.discovery(eml_data)

 
  # puts manager.add_user('Ashish', 'en_US')

  
  #7721604

 

    @welcomes = Welcome.all
  end

  # GET /welcomes/1
  # GET /welcomes/1.json
  def show
  end

  # GET /welcomes/new
  def new
    @welcome = Welcome.new
  end

  # GET /welcomes/1/edit
  def edit
  end

  # POST /welcomes
  # POST /welcomes.json
  def create
    require 'sift_email_api'


    manager = SiftEmailApi.new('', '')
  
    #puts manager.list_connections('Ashish')
    # begin
    #   puts manager.add_gmail_connection("username", "ashish.a.singh.yzz@gmail.com", "")
    # rescue => e
    #   logger.error e.message
    # end

    p '*' * 100
    puts manager.add_gmail_connection("username","ashish.a.singh.yzz@gmail.com","")
    p '*' * 100


    # @welcome = Welcome.new(welcome_params)

    # respond_to do |format|
    #   if @welcome.save
    #     format.html { redirect_to @welcome, notice: 'Welcome was successfully created.' }
    #     format.json { render :show, status: :created, location: @welcome }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @welcome.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /welcomes/1
  # PATCH/PUT /welcomes/1.json
  def update
    respond_to do |format|
      if @welcome.update(welcome_params)
        format.html { redirect_to @welcome, notice: 'Welcome was successfully updated.' }
        format.json { render :show, status: :ok, location: @welcome }
      else
        format.html { render :edit }
        format.json { render json: @welcome.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /welcomes/1
  # DELETE /welcomes/1.json
  def destroy
    @welcome.destroy
    respond_to do |format|
      format.html { redirect_to welcomes_url, notice: 'Welcome was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_welcome
      @welcome = Welcome.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def welcome_params
      params.fetch(:welcome, {})
    end
end
