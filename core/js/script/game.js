/* globals db, mozRequestAnimationFrame,webkitRequestAnimationFrame,trace,Stats,genTable ,SUCCESS,FAILURE,RUNNING,BaseNode,Die,Gang,BaseCity*/

var Game = {};
Game.fps = .5

var gCity;

var tree;
var blackboard;



function launchGame(){
	//agent.smarts = {sides:10,value:5}
//	trace('Smarts: '+agent.smarts)
	setupTree()
}

Game.initialize = function() {	
	Game.Time = 0
	gCity = new BaseCity()	
	launchGame();
};

Game.run = (function() {	
		var loops = 0;
		var skipTicks = 1000 / Game.fps;
		var maxFrameSkip = 10;
		var nextGameTick = (new Date).getTime();

        return function() {
						
          loops = 0;
          while ((new Date).getTime() > nextGameTick) {
           // updateStats.update();
            Game.update();
            nextGameTick += skipTicks;
            loops++;
          }
          //renderStats.update();
         // Game.draw();
        };
})();








Game.draw = function() {
	trace('draw')
};


Game.update = function() {
	db(Game.Time)
	//$('#trace').html('Movement history: '+agent.history)
	//$('#gClock').html('Clock: '+gTime )
	Game.Time ++;
};


var findRange = function(){	
	var xDif = pog.pos.x  - this.pos.x;
	var yDif = pog.pos.y  - this.pos.y;
	var distance = Math.abs(xDif) + Math.abs(yDif);	
	this.distance = Number(distance);
	//$(this).append('<p>Dist: '+Number(this.help*this.distance).toFixed(1) +'</p>')
	$(this).append('<p>Real: '+this.distance +'</p>')
	//$(this).append('<p>Rand: '+( Math.random()+this.help).toFixed(1) +' real: '+this.distance +'</p>')
	
}



function setupTree(){
		
	blackboard = new Blackboard();
	tree       = new BehaviorTree();
	tree.root  = new Sequence(
/*		new Inverter(new CheckForGold()),
		new Sequence(
			new selectAdjacent(),
			new checkSmarts()					
		),
		new moveToSector()*/
	  )
	 oe()
	window.onEachFrame(Game.run);	
	
}



//CHECK FOR GOLD

var CheckForGold = function() { this.initialize();}
CheckForGold.prototype = new BaseNode();
CheckForGold.prototype.tick = function(tick) {	
    if ($(tick.target.td).hasClass('isgold')) {		
		//trace('check gold: '+'SUCCESS')
        return SUCCESS;
    } else {		
		//trace('check gold: '+'FAILURE')
        return FAILURE;
    }
}



//SELECT THE SECTOR TO MOVE TO (lowest distance)

var selectAdjacent = function() {this.initialize()}
selectAdjacent.prototype = new BaseNode();
selectAdjacent.prototype.tick = function(tick) {

	var _ai =tick.target.td
	var _agent =tick.target
	var minVal 
	var _correctDist = new Die(_agent.smarts.sides,_agent.smarts.value)
				
	
	if(_correctDist.result()){
		minVal = Number(_ai.distance)
		//trace('C____________________________: '+minVal)
	}else{
		minVal = Number(_ai.distance + _correctDist.returnVal - Number(_agent.smarts.value))
		//trace('F____________________________: '+minVal)
	}
	var _ele = false


		$(_ai.adjacent).each(function(index, element) {
			
			
							
			if(minVal > Number(element.distance)){
				
			var rolled = new Die(_agent.smarts.sides,element.help)
			var helpful = rolled.result()
			
			
				if(helpful){
					trace('updated')
					minVal = element.distance;			
					_ele = element;
				}
			}			        
		})
	
	if(_ele){
		tick.target.moveToSector = _ele;
		return SUCCESS;
	}
	
	else{
		agent.history.push(' UNHELPFUL')
		return FAILURE;
	} 	
	
	
    
}



//check if its smart enough to proceed the move(dice role)

var checkSmarts = function() {this.initialize()}
checkSmarts.prototype = new BaseNode();
checkSmarts.prototype.tick = function(tick) {

	var agent = tick.target
	
	var rolled = new Die(agent.smarts.sides,agent.smarts.value)
	
	if(rolled.result()){
		//tick.target.moveToSector = _ele;
	//	trace('checkSmarts: SUCCESS')
		return SUCCESS;
	}
	else{
	//	trace('checkSmarts: FAILURE')
		agent.history.push(' STUPID')
		return FAILURE;
	} 
}


//move to sector
var moveToSector = function() {this.initialize()}
moveToSector.prototype = new BaseNode();
moveToSector.prototype.tick = function(tick) {
	//trace('MOVE')
	agent.history.push(tick.target.moveToSector.id.split('_')[1])
	agent.updateTd(tick.target.moveToSector)	
	return SUCCESS;	
}

