extends Node3D

var enabled = false 
var node_cake: Cake = null

func _ready():
	$TimerCake.timeout.connect(_timer_cake_timeout)
	$TimerCake.start()

func start(p_node_cake: Cake):
	node_cake = p_node_cake
	enabled = true 
	node_cake.start()
	
func stop():
	node_cake.stop()
	enabled = false 
	node_cake = null
	
func fail():
	stop()
	var manager_request = SharedRes.manager_request as ManagerRequest
	if enabled:
		manager_request.submit_failure(TRICKS.VAR.CAKE)
	
func _timer_cake_timeout():
	var manager_request = SharedRes.manager_request as ManagerRequest
	if enabled:
		manager_request.submit_trick(TRICKS.VAR.CAKE)
