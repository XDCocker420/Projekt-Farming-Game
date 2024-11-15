extends Node


var config = ConfigFile.new()


func _ready() -> void:
    var err = config.load("res://scripts/config/crops_config.cfg")

    # If the file didn't load, ignore it.
    if err != OK:
        return


func get_crop_time(crop_name:String):
    return config.get_value(crop_name, 'growth_time')


func get_crop_value(crop_name:String):
    return config.get_value(crop_name, 'value')
