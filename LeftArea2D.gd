extends Area2D

var textures = ["image1.png", "image2.png", "image3.png", "image4.png"]

var collision_shape

func _ready():
    get_tree().debug_collisions_hint = true
    
    # Choose a random texture for the sprite
    randomize()
    var random_index = randi() % textures.size()
    $LeftSprite.texture = load("res://" + textures[random_index])
    
    # Determine the dimensions of the sprite
    var sprite_width = $LeftSprite.texture.get_width()
    var sprite_height = $LeftSprite.texture.get_height()
    var dimensions = Vector2(sprite_width / 2, sprite_height / 2)
    
    collision_shape = CollisionShape2D.new()
    collision_shape.name = "LeftCollisionShape2D"
    add_child(collision_shape)
    
    collision_shape.shape = RectangleShape2D.new()
    
    # Set the collision shape extents to match the size of the sprite
    collision_shape.shape.set_extents(dimensions)
    
    $RightArea2D.position.x += 100
    