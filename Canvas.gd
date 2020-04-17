extends TileMap


var x_size = 60
var y_size = 30
var tile_size = self.cell_size
var rect_size = get_used_rect()

var data_koordinat = []

func set_tile(pos):
	var tile_pos = world_to_map(pos)
	set_cellv(tile_pos, tile_set.find_tile_by_name("white_tile"))
	update_dirty_quadrants()
	fix_invalid_tiles()
	data_koordinat.append(tile_pos)

func remove_tile(pos):
	var tile_pos = world_to_map(pos)
	set_cellv(tile_pos, INVALID_CELL)
	update_dirty_quadrants()
	fix_invalid_tiles()
	data_koordinat.erase(tile_pos)
	
func get_data_koordinat():
	return data_koordinat

func _ready():
	update()

func _on_BidangKoordinat_draw():
	for y in range(0, y_size):
		draw_line(Vector2(0, y * tile_size.y), Vector2(tile_size.y * x_size, y * tile_size.y), Color.white)
	for x in range(0, x_size):
		draw_line(Vector2(x * tile_size.x, 0), Vector2(x * tile_size.x, y_size * tile_size.y), Color.white)
