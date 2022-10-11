extends Node

# https://gotm.io/dairyfreelemons/test


# Called when the node enters the scene tree for the first time.
func _ready():
	var config = GotmConfig.new()
# Replace the empty string with your project key.
	#Essential- put your own project key in here
	config.project_key = "authenticators/YYl11yIWQ8jg2Twdgh3B"
	config.beta_unsafe_force_global_contents = true
	Gotm.initialize(config)

#save
func _on_Button_button_down():
	var inventory = ["sword",$Label.text, $CheckBox.pressed]
	var is_private = true
	var content = yield(GotmContent.create(inventory, "", {}, "", [], is_private), "completed")
	

func _on_load2_button_down():
	#use the query to get the ID of your private content
	var query = yield(GotmContent.list(GotmQuery.new().filter("is_private", true)), "completed")
	var id = query[0].id
	#use your ID to retrieve the content,  in this case an array, but can also be a dictionary
	var content = yield(GotmContent.get_variant(id), "completed")
#	var inventory = yield(GotmContent.get_variant(content), "completed")
	$Label.text = content[1]
	$CheckBox.pressed = content[2]
