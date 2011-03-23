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
    if !params[:productid].nil? 
    @product2 = Product.find(params[:productid])
    puts 'This is the @product2'
    puts @product2.name
    if !@product2.category_id.nil?
    @parentcat = Category.find(@product2.category_id)
    
    if !@parentcat.parentid.nil?
    @parentcat2 = Category.find(@parentcat.parentid)
    if !@parentcat2.parentid.nil?
    @parentcat3 = Category.find(@parentcat2.parentid)
    end
    end
    end
    
    end
    @testid = params[:categoryid]
    if !@testid.nil?
    @testcat = Category.find(@testid)
    puts 'testing'
    @category2=Category.find(params[:categoryid])
    if !@category2.parentid.nil?
    	@parenttest = Category.find(@category2.parentid)
    	if !@parenttest.parentid.nil?
    		@parentcat = @category2
    		@parentcat2 = @parenttest
    		@parentcat3 = Category.find(@parenttest.parentid)
    	else
    		@parentcat2 = @category2
    		@parentcat3 = @parenttest
    	end
    else 
    	@parentcat3 = @category2
    end
    
    
    end
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
  @test=Category.find(params[:id])
 
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
 	puts 'test search 1'
	@categories = Category.all
	@category = Category.new
	#@products = Product.all
    @product = Product.new

if !params[:id].nil?
    @phrase = params[:id] 
    #@category2 = Category.find(params[:id])
    puts '@category2'
    puts @category2
    
    @categoryname = Category.find(@phrase)
    @category2 = @categoryname
    @products2 =Product.find(:all, :conditions => ['category_id=?', @categoryname.id])   

	@products = []
	@products2.each do |products2|
	puts products2.name
	puts products2.parentid
	if products2.parentid.nil?
	@products << products2
	
	end
	end

#prototype solution will not work with jquery
#render :update do |page| 
 # page.replace_html 'results', :partial => 'searchresults'
      #Also update the preview
  #page.replace_html 'preview', :partial => 'category'
#end




    #render :partial => 'chosencat'
    render :partial => 'searchresults'
    #render :partial => 'category'

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
	@category2 = Category.find(params[:id])
	if !@category2.parentid.nil?
	@parentcat = Category.find(@category2.parentid)
	
	if !@parentcat.parentid.nil?
   	@parentcat2 = Category.find(@parentcat.parentid)
    if !@parentcat2.parentid.nil?
    @parentcat3 = Category.find(@parentcat2.parentid)
	end
	end
	end
	puts '@parentcat2'
	puts @parentcat2
	puts '@category2'
	puts @category2
	@category = Category.new
	render :partial => 'category'

end

def choosecat2
	@category2 = Category.find(params[:id])
	@parentcat = @category2
	if !@parentcat.parentid.nil?
	
	@parentcat2 = Category.find(@parentcat.parentid)
	end
	
	
	puts '@parentcat2'
	puts @parentcat2.name
	puts '@category2'
	puts @category2.name
	@category = Category.new
	render :partial => 'category'

end

def choosecat3
	@parentcat = Category.find(params[:id])
	@parentcat2 = Category.find(@parentcat.parentid)
	@parentcat3 = Category.find(@parentcat2.parentid)
	@category2 = @parentcat
	render :partial => 'category'
end

def chooseprod
	@product2 = Product.find(params[:id])
	if !@product2.category_id.nil?
    @parentcat = Category.find(@product2.category_id)
    
    if !@parentcat.parentid.nil?
    @parentcat2 = Category.find(@parentcat.parentid)
    if !@parentcat2.parentid.nil?
    @parentcat3 = Category.find(@parentcat2.parentid)
    end
    end
    end
    @products = Product.all
    @product = Product.new
	render :partial => 'product'
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

def catnew
	@category = Category.new
	@testid = params[:id]
    if !@testid.nil?
    @testcat = Category.find(@testid)
    puts 'testing'
    
    @category2=Category.find(params[:id])
    if !@category2.parentid.nil?
    	@parenttest = Category.find(@category2.parentid)
    	if !@parenttest.parentid.nil?
    		@parentcat = @category2
    		@parentcat2 = @parenttest
    		@parentcat3 = Category.find(@parenttest.parentid)
    	else
    		@parentcat2 = @category2
    		@parentcat3 = @parenttest
    	end
    else 
    	@parentcat3 = @category2
    end
    
    
    end
render :partial => '/categories/form.html'

end

def prodnew
	@product = Product.new
	
	render :partial => '/products/form.html'

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
