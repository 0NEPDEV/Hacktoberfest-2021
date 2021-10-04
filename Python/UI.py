import pygame


class Text:
	def __init__(self, font_size, color, surface):
		self.font_size = font_size
		self.color = color
		self.surface = surface

		self.font = pygame.font.Font("freesansbold.ttf", self.font_size)

	def draw(self, text, x, y):
		texture = self.font.render(text, True, self.color)
		self.surface.blit(texture, (x, y))


class Button:
	def __init__(self, surface, rect, color, text):
		self.surface = surface
		self.rect = rect
		self.color = color
		self.text = text

		self.font = Text(32, self.color, self.surface)

	def is_clicked(self):
		self.mouse = pygame.mouse.get_pos()

		if self.rect.collidepoint(self.mouse):
			if pygame.mouse.get_pressed()[0]:
				return True

	def draw(self):
		pygame.draw.rect(self.surface, self.color, self.rect, 2)

		x = (self.rect.x + self.rect.w)/2
		y = self.rect.y + 20
		self.font.draw(self.text, x, y)
