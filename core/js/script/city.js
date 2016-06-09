/* globals trace,BaseFacility,BaseSector,Stats,genTable ,SUCCESS,FAILURE,RUNNING,createUUID,Die,randomFromArray,$*/

var gridSize = {h:2,w:2}


var BaseCity = function() {
  this.initialize();
}
BaseCity.prototype.initialize = function() {
  	

  
  
		var _city = this
		_city.id  = createUUID()
		_city.sectors = []
		_city.population = 0
		
        _city.init = function() {
			 //init city 
			 //create sectors
			 var totalsectors = gridSize.h * gridSize.w;			 
			 for(var i=0;i<gridSize.h;i++){
				 
				  for(var j=0;j<gridSize.w;j++){
					 var _sec = new BaseSector({x:i,y:j})
				 	_city.sectors.push(_sec)
					_city.population+=_sec.population
				  }
				 
				 
			 }
            //this.content = generateGrid(gridSize.h,gridSize.w)
        }
		 _city.update =  function() {
			 _city.population = 0
			 	  $(_city.sectors).each(function(index, element) {
                    element.update()
					
					_city.population+=element.population
                });
        }
		this.init()

}

























function generateGrid(rows,cols){
	tab = $('<table class="atable"></table>')
	right_cell= false
	left_cell = false
	up_cell = false
	down_cell = false
	counter = 0
	
	
	for(var i=0;i<rows;i++){
		var _row = $('<tr></tr>')	
					
		for(var j=0;j<cols;j++){

			_td = $('<td class="sector"></td>')
			counter++
			_td.idx = counter
			_td[0].pos = {	x:i,y:j	}			
			_row.append(_td)
		}
		tab.append(_row)
	}
	$('#City').append(tab)
	
	
	$('tr','.atable').each(function(rowIndex, arow) {

		
		$('td',arow).each(function(colIndex, acell) {
			
			acell.adjacent = [0,0,0,0]
			
			acell.urdl = {
				up:false,down:false,left:false,right:false
				}
			
			if($(acell).next().size()){
				
				acell.urdl.right = $(acell).next()[0]
				acell.adjacent[1] = $(acell).next()[0]
				
			}
			if($(acell).prev().size()){
				acell.urdl.left = $(acell).prev()[0]
				acell.adjacent[3] = $(acell).prev()[0]				
			}
			
			if(rowIndex>0){
				acell.urdl.up = $('tr','.atable').eq(rowIndex-1).find('td').eq(colIndex)[0]
				acell.adjacent[0] = acell.urdl.up	
				
			}
			if(rowIndex<rows-1){
				acell.urdl.down = $('tr','.atable').eq(rowIndex+1).find('td').eq(colIndex)[0]
				acell.adjacent[2] = acell.urdl.down
			}
			
						
        });		
    });
	
	
	return $('.atable')
}





