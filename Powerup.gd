extends Area2D

var screensize = Vector2()

func _ready() -> void:
  $Tween.interpolate_property($AnimatedSprite, 'scale',
    $AnimatedSprite.scale,
    $AnimatedSprite.scale * 3, 0.3,
    Tween.TRANS_QUAD,
    Tween.EASE_OUT)
  $Tween.interpolate_property($AnimatedSprite,
  'modulate',
  Color(1,1,1,1),
  Color(1,1,1,0), 0.3,
  Tween.TRANS_QUAD, Tween.EASE_IN_OUT)

func pickup():
  monitoring = false
  $Tween.start()

func _on_Tween_tween_completed(_object: Object, _key: NodePath) -> void:
  queue_free()

func _on_Powerup_area_entered(area: Area2D) -> void:
  if area.is_in_group("powerups"):
    position = Vector2(rand_range(0,screensize.x),rand_range(0,screensize.y))
  if area.is_in_group("obstacles"):
    position = Vector2(rand_range(0, screensize.x), rand_range(0, screensize.y))

func _on_Lifetime_timeout() -> void:
  queue_free()
