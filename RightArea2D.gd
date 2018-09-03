extends Area2D

var collision_shape

var textures = ["image1.png", "image2.png", "image3.png", "image4.png"]

func _ready():
    get_tree().debug_collisions_hint = true
    
    # Choose a random texture for the sprite
    randomize()
    var random_index = randi() % textures.size()
    $RightSprite.texture = load("res://" + textures[random_index])
    
    # Determine the dimensions of the sprite
    var sprite_width = $RightSprite.texture.get_width()
    var sprite_height = $RightSprite.texture.get_height()
    var dimensions = Vector2(sprite_width / 2, sprite_height / 2)
    
    collision_shape = CollisionShape2D.new()
    collision_shape.name = "RightCollisionShape2D"
    add_child(collision_shape)
    
    collision_shape.shape = RectangleShape2D.new()
    
    # Set the collision shape extents to match the size of the sprite
    collision_shape.shape.set_extents(dimensions)
