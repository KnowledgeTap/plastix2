class HomesController < ApplicationController
  # GET /homes
  # GET /homes.xml
  def index
    @homes = Home.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @homes }
    end
  end

  # GET /homes/1
  # GET /homes/1.xml
  def show
    @home = Home.find(params[:id])
    
    #@phrase = Category.search(params[:category]) #".search method is in the Model"
    
	@categories = Category.all
	#@categories = Category.find(:all) #, :conditions => ['parentid=?', nil]) 
	
	@categoryinit = []
	@categories.each do |category|
	if category.parentid.nil?
	@categoryinit << category
	
	end
	end
	
	
    @category = Category.new
    @products = Product.all
    @product = Product.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @home }
    end
  end

  # GET /homes/new
  # GET /homes/new.xml
  def new
  @test=params[:id]
 
    @home = Home.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @home }
    end
  end

  # GET /homes/1/edit
  def edit
    @home = Home.find(params[:id])
  end

  # POST /homes
  # POST /homes.xml
  def create
    @home = Home.new(params[:home])

    respond_to do |format|
      if @home.save
        format.html { redirect_to(@home, :notice => 'Home was successfully created.') }
        format.xml  { render :xml => @home, :status => :created, :location => @home }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @home.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /homes/1
  # PUT /homes/1.xml
  def update
    @home = Home.find(params[:id])

    respond_to do |format|
      if @home.update_attributes(params[:home])
        format.html { redirect_to(@home, :notice => 'Home was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @home.errors, :status => :unprocessable_entity }
      end
    end
  end

# Search
def search

	@test=params[:parent]
 
	@categories = Category.all
	@category = Category.new
	#@products = Product.all
    @product = Product.new

if !params[:id].nil?
    @phrase = params[:id] 
    @categoryname = Category.find(@phrase)
    @products2 =Product.find(:all, :conditions => ['category_id=?', @categoryname.id])   

	@products = []
	@products2.each do |products2|
	puts products2.name
	puts products2.parentid
	if products2.parentid.nil?
	@products << products2
	
	end
	end


    #render :partial => 'chosencat'
    render :partial => 'searchresults'

  end
  
     
end       

def search2

@test=params[:parent]
  
	@product = Product.new
if !params[:id].nil?
    @phrase2 = params[:id] 
    @productname = Product.find(@phrase2)
    
    
    
    if !@productname.category_id.nil?
    @parentcat = Category.find(@productname.category_id)
    
    if !@parentcat.parentid.nil?
    @parentcat2 = Category.find(@parentcat.parentid)
    if !@parentcat2.parentid.nil?
    @parentcat3 = Category.find(@parentcat2.parentid)
    end
    end
    end
    
    
    
    @prodvar= Product.find(:all, :conditions => ['parentid=?', @productname.id])
    
    
    
    
    render :partial => 'searchresults2'

  end
          
end       

def search3

	#@products = Product.all
    @product = Product.new
	@category = Category.new
	@categories = Category.all
if !params[:id].nil?
    @phrase3 = params[:id] 
    @categoryname2 = Category.find(@phrase3)
    @products2 =Product.find(:all, :conditions => ['category_id=?', @categoryname2.id])   
	@parentcat = Category.find(@categoryname2.parentid)
    
    
    @products = []
	@products2.each do |products2|
	puts products2.name
	puts products2.parentid
	if products2.parentid.nil?
	@products << products2
	
	end
	end
    
    
    render :partial => 'searchresults3'

  end
          
end       

def search4

	@products = Product.all
    @product = Product.new
	@categories = Category.all
if !params[:id].nil?
    @phrase4 = params[:id] 
    @categoryname3 = Category.find(@phrase4)
    @parentcat = Category.find(@categoryname3.parentid)
    @parentcat2 = Category.find(@parentcat.parentid)
    @products2 =Product.find(:all, :conditions => ['category_id=?', @categoryname3.id])
    
    
    @products = []
	@products2.each do |products2|
	puts products2.name
	puts products2.parentid
	if products2.parentid.nil?
	@products << products2
	
	end
	end
    
    
    render :partial => 'searchresults4'

  end
          
end       


def choosecat
	render :partial => 'chosencat'

end

def copy
	
	if !params[:id].nil?
    @phrase2 = params[:id] 
    @productname = Product.find(@phrase2)
	end
	
	@products = Product.all
    @product = Product.new
	@categories = Category.all
	
	render :partial => '/products/copy.html'

end



  # DELETE /homes/1
  # DELETE /homes/1.xml
  def destroy
    @home = Home.find(params[:id])
    @home.destroy

    respond_to do |format|
      format.html { redirect_to(homes_url) }
      format.xml  { head :ok }
    end
  end
end
