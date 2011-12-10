class SurveysController < ApplicationController
  # GET /surveys
  # GET /surveys.xml
  def index
    @surveys = Survey.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @surveys }
    end
  end

  # GET /surveys/1
  # GET /surveys/1.xml
  def show
    @survey = Survey.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @survey }
    end
  end
  
  # GET /surveys/1/take
  def take
    @survey = Survey.find(params[:id])

    respond_to do |format|
      format.html # take.html.erb
    end
  end

  # GET /surveys/new
  # GET /surveys/new.xml
  def new
    @survey = Survey.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @survey }
    end
  end

  # GET /surveys/1/edit
  def edit
    @survey = Survey.find(params[:id])
  end

  # POST /surveys
  # POST /surveys.xml
  def create
    @survey = Survey.new(params[:survey])

    respond_to do |format|
      if @survey.save
        format.html { redirect_to(@survey, :action => "edit", :notice => 'Survey was successfully created.') }
        format.xml  { render :xml => @survey, :status => :created, :location => @survey }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /surveys/1
  # PUT /surveys/1.xml
  def update
    @survey = Survey.find(params[:id])
    success = @survey.update_attributes(params[:survey])
    
    # Load the JSON Survey form data.
    survey_questions = ActiveSupport::JSON.decode(@survey.survey_data)
    y survey_questions
    
    # Render a response.
    respond_to do |format|
      if success
        format.html { redirect_to(@survey, :notice => 'Survey was successfully updated.') }
        format.xml  { head :ok }
        format.js { head :ok}
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @survey.errors, :status => :unprocessable_entity }
        format.js { render :json => @survey.errors, :status => :error }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.xml
  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy

    respond_to do |format|
      format.html { redirect_to(surveys_url) }
      format.xml  { head :ok }
      format.js { render :text => "alert('Survey removed.')" }
    end
  end
end
