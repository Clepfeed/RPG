extends GridContainer

func _ready():
	# Задаем размер слотов
	self.columns = 6  # Количество колонок в сетке
	self.custom_minimum_size = Vector2(64, 64)  # Минимальный размер слота
	
	# Создаем элементы и добавляем в GridContainer
	for i in range(6):
		var button = Button.new()
		button.text = "Button %d" % i
		button.rect_min_size = Vector2(64, 64)  # Устанавливаем фиксированный размер элементов
		add_child(button)

	# Проверка выравнивания (при необходимости)
	for child in get_children():
		if child is Control:
			child.margin_right = 0
			child.margin_bottom = 0
