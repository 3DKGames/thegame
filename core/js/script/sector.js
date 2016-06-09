/* globals trace,Stats,genTable ,BaseFacility,SUCCESS,randomInt,FAILURE,RUNNING,createUUID,Die,$*/

//residential , industrial , comercial , slum
var sectorTypes = ['R','I','C','S']


var BaseSector = function(pos) {
  this.initialize(pos);
}
BaseSector.prototype.initialize = function(pos) {
  	
		var _sector = this;
		_sector.id = createUUID()		
		_sector.facilities = []
		_sector.position = pos
		_sector.population = 0;
		_sector.income = 0		
		_sector.stats = {}
		_sector.units = [false,false,false,false,false,false]
		
		_sector.resetStats = function() {		
			this.stats = {		
			DEFbonus:0,
			ATTbonus:0,
			RESISTENCE:0	
			}
		}
		
		
        _sector.init= function() {
			_sector.resetStats()
			
			for(var i=0;i<3;i++){
				var _fac = new BaseFacility()
				_sector.facilities.push(_fac)

			}
			_sector.update()
			
		}		
		_sector.update= function() {
			_sector.resetStats()
			$(_sector.facilities).each(function(index, element) {
				element.update()				
				_sector.income += element.income
				_sector.population += element.population
				_sector.stats.DEFbonus += element.stats.DEFbonus
				_sector.stats.ATTbonus += element.stats.ATTbonus
				_sector.stats.RESISTENCE += element.stats.RESISTENCE
			});

		    
		}
		this.init()
		
		return this;
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





