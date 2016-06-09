/* globals trace,Stats,genTable ,SUCCESS,FAILURE,RUNNING,createUUID,Die,$*/
var BaseAgent = function() {
  this.initialize();
}
BaseAgent.prototype.initialize = function() {
  this.id = createUUID(); 
  this.history = { }

}


var Gang = function(name,history,stats,upkeep,location) {
	
	this.name = name || 'dummy'
	this.upkeep = upkeep || 1
	this.history = history || {position:[]}	
	this.location = location || {x:0,y:0}
	this.stats = stats || {
    	HP: 10,
		INT:10,
		SPD:10,
		ATT:10,
		DEF:10
		
	}
	
}
Gang.prototype = new BaseAgent();



//var cops = new Gang('Cops',false,{HP:25,INT:8,ATT:7,DEF:7})
//var robs = new Gang('Robbers',false,{HP:25,INT:8,ATT:7,DEF:7})