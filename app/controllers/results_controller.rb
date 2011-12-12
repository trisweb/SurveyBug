class ResultsController < ApplicationController
  # GET /results
  # GET /results.xml
  def index
    if params[:survey_id]
      @survey = Survey.find(params[:survey_id])
      @results = @survey.results
    else
      @results = Result.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @results }
    end
  end
  
  
  def create
    puts "Creating new Result for survey..."
    @result = Result.new(params[:result])
    @result.date = Time.now
    @survey = @result.survey
    
    @result.content = get_content_for_survey_result(@result, @survey, params)
    puts "Content: #{@result.content}"
    
    respond_to do |format|
      if @result.save
        format.html { redirect_to(@result, :notice => 'Thank you for participating!') }
      else
        format.html { render("surveys/take") }
        format.xml  { render :xml => @result.errors, :status => :unprocessable_entity }
      end
    end
  end
  

  # GET /results/1
  # GET /results/1.xml
  def show
    @result = Result.find(params[:id])
    @survey = @result.survey

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @result }
    end
  end


  # DELETE /results/1
  # DELETE /results/1.xml
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to(results_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
    # This parses the form result into the content field of the result.
    # This could be extended in the future to store content in whatever format is desired, for example
    # using a key-value database store reference, or in XML format. For now we'll store as a nice formatted string.
    def get_content_for_survey_result(result, survey, params)
      #y params
      
      # Param format example:
      #   question-0-id: '13'
      #   question-0-text: How many pets do you have?
      #   question-0-value: '1'
      #   question-1-id: '14'
      #   question-1-text: What are your favorite foods?
      #   question-1-value-0: 'Cake'
      
      questions = Array.new
      question_params = params.reject{|k,v| !k.starts_with?("question-")}
      question_params.each do |k,v|
        keysplit = k.split("-")
        n = keysplit[1].to_i
        att = keysplit[2]
        questions[n] = Hash.new if questions[n].nil?
        qhash = questions[n]
        if att == "value"
          # Possible multiple values for checkbox, so use an array.
          qhash[att] = Array.new if !qhash.has_key?(att)
          qhash[att].push(v)
        else
          qhash[att] = v
        end
      end
      
      # Store a JSON-String
      ActiveSupport::JSON.encode(questions)
    end
end
