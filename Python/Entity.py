import pygame


class Entity:
	def __init__(self, rect, color, surface):
		self.rect = rect
		self.color = color
		self.surface = surface

	def draw(self):
		pygame.draw.rect(self.surface, self.color, self.rect)

	def event(self, event):
		if event.type == pygame.KEYDOWN:
			if event.key == pygame.K_LEFT:
				self.color = pygame.Color("red")
			if event.key == pygame.K_RIGHT:
				self.color = pygame.Color("blue")
			if event.key == pygame.K_UP:
				self.color = pygame.Color("yellow")
			if event.key == pygame.K_DOWN:
				self.color = pygame.Color("green")

	def check_color(self, color):
		if self.color == color:
			return True
		return False

	def check_collision(self, entity):
		if (self.rect.x <= entity.rect.x <= (self.rect.x + self.rect.w)) or (
				entity.rect.x <= self.rect.x <= (entity.rect.x + entity.rect.w)):
			if (self.rect.y <= entity.rect.y <= (self.rect.y + self.rect.h)) or (
					entity.rect.y <= self.rect.y <= (entity.rect.y + entity.rect.h)):
				return True
		return False
