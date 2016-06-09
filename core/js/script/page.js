

function randomInt(min,max)
{
    return Math.floor(Math.random()*(max-min+1)+min);
}
function randomFromArray(arr)
{
	return arr[Math.floor(Math.random()*arr.length)];	
}


function getKeyArray(arr,key,val){
	
	var rArray = jQuery.grep(arr, 		 
	function(element, index){
		
			return element[key]
	})	

	return rArray;
}


var trace = function(string){try{console.log(string)}catch(e){}};
var db = function(string){
	$('#db').prepend('<br>'+string)
	};
	


var oe = function() {
        var onEachFrame;
        if (window.requestAnimationFrame) {
			
//			trace('requestAnimationFrame')
          onEachFrame = function(cb) {
            var _cb = function() { 
				cb(); 
				webkitRequestAnimationFrame(_cb); 
			}
            _cb();
          };
        } else if (window.mozRequestAnimationFrame) {
			
			//trace('moz')
          onEachFrame = function(cb) {
            var _cb = function() { cb(); mozRequestAnimationFrame(_cb); }
            _cb();
          };
        } else {
			//trace('setInterval')
          onEachFrame = function(cb) {
            setInterval(cb, 1000 / Game.fps);
          }
        }
        
        window.onEachFrame = onEachFrame;
}


function genTable(rows,cols){
	tab = $('<table class="atable"></table>')
	right_cell= false
	left_cell = false
	up_cell = false
	down_cell = false
	counter = 0
	
	
	for(var i=0;i<rows;i++){
		var _row = $('<tr></tr>')	
					
		for(var j=0;j<cols;j++){

			_td = $('<td class="block"></td>')
			counter++
			_td.idx = counter
			_td[0].pos = {	x:i,y:j	}			
			_row.append(_td)
		}
		tab.append(_row)
	}
	$('#board').append(tab)
	
	
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

var Die = function(sides,smartness) {
	
	
  this.sides = sides || 6;
  this.smartness = smartness|| this.sides;
  this.returnVal = false;
}

Die.prototype.roll = function() {

	this.returnVal = Number(Math.floor((Math.random()*this.sides)+1));
	return this.returnVal;
}

Die.prototype.result = function() {

	if(this.roll() <= this.smartness){
		return true;
	}else{
		return false;
	}
//  return Math.floor((Math.random()*this.sides)+1);
}
