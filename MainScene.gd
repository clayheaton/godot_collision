extends Node2D

var right_scene

var shapes = []

var pos0 = Vector2(200, 200)
var pos1 = Vector2(500, 200)
var pos2 = Vector2(200, 500)
var pos3 = Vector2(500, 500)

var positions = [pos0, pos1, pos2, pos3]

var shape_to_replace = 0

func _ready():
    get_tree().debug_collisions_hint = true
    
    right_scene = load("res://LeftArea2D.tscn")
    
    # Add initial shapes
    for p in positions:
        var s = right_scene.instance()
        s.position = p
        shapes.append(s)
        add_child(s)
        
    $Timer.start()


func replace_shape():
    var old_shape = shapes[shape_to_replace]
    
    var new_shape = right_scene.instance()
    new_shape.position = positions[shape_to_replace]
    shapes[shape_to_replace] = new_shape
    add_child(new_shape)
    
    remove_child(old_shape)
    old_shape.queue_free()
    
    shape_to_replace += 1
    
    if shape_to_replace > 3:
        shape_to_replace = 0
        
    $Timer.start()
    

func _on_Timer_timeout():
    replace_shape()
