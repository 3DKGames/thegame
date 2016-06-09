/* globals trace,BaseSector,Stats,genTable ,randomInt,SUCCESS,FAILURE,RUNNING,createUUID,Die,randomFromArray,$*/

//residential , industrial , comercial , slum
var facilityTypes = [
				{
					type:'RES',
					incomeMulti:2,
					popMulti:4
				},
				{
					type:'IND',
					incomeMulti:4,
					popMulti:1},
				{
					type:'COM',
					incomeMulti:5,
					popMulti:1					
				},
				{	type:'SLU',
					incomeMulti:1,
					popMulti:3}]


var BaseFacility = function() {
  this.initialize();
}

BaseFacility.prototype.initialize = function(a) {
 	

		this.id =createUUID()
		var typeObj = randomFromArray(facilityTypes)
		this.position={}

		this.type = typeObj.type
		
		
		
		this.population = randomInt(1,10)*typeObj.popMulti
		this.income = randomInt(1,10)*typeObj.incomeMulti
		this.stats = {		
			DEFbonus:randomInt(1,10),
			ATTbonus:randomInt(1,10),
			RESISTENCE:randomInt(1,10)	
		}
		
		
        this.init= function() {
			
		}		
		this.update= function() {
		    
		}
		
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





