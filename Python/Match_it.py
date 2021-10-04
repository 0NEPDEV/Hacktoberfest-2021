import pygame
import random
from Entity import *
from UI import *
import os

high_score = 0


def save(score):
	with open("HighScore.txt", "w") as w:
		w.write(str(score))


def check_score(score):
	with open("HighScore.txt", "r") as r:
		try:
			prev_score = int(r.read())
		except:
			pass

	if score > prev_score:
		save(score)


class Map:
	""" Map generator """

	def __init__(self, width, height, surface):
		self.width = width
		self.height = height
		self.surface = surface
		self.entities = []
		self.entities_no = 6
		self.dist = 240

		self.speed = 4
		self.score = 0

		self.colors = [
			pygame.Color("red"),
			pygame.Color("green"),
			pygame.Color("blue"),
			pygame.Color("yellow")
		]

		self._generate()

	def _generate(self):
		x = int(self.width/2)
		y = 0
		for i in range(self.entities_no):
			color = random.choice(self.colors)
			ent = Entity(pygame.Rect(x, y, 20, 70), color, self.surface)
			self.entities.append(ent)
			y -= self.dist

	def _generate_using_index(self, index):
		y = -self.dist*3.5
		x = int(self.width/2)
		color = random.choice(self.colors)
		self.entities[index] = Entity(pygame.Rect(x, y, 20, 70), color, self.surface)

	def check_collision(self, player_entity):
		for ent in self.entities:
			if ent.check_collision(player_entity):
				if not ent.check_color(player_entity.color):
					return True

	def draw(self):
		for i in self.entities:
			i.draw()
			i.rect.y += self.speed

			if i.rect.y >= self.height:
				self._generate_using_index(self.entities.index(i))
				self.score += 1

		if 0 < self.score < 10:
			self.speed = 4
		if 10 < self.score < 20:
			self.speed = 6
		if 20 < self.score < 30:
			self.speed = 8
		if 40 < self.score < 50:
			self.speed = 9


class Menu:
	"""Main Menu class"""

	def __init__(self, surface):
		self.surface = surface
		self.running = True

		self.text = Text(32, (0, 0, 0), self.surface)
		self.text2 = Text(25, (0, 0, 0), self.surface)
		self.button1 = Button(self.surface, pygame.Rect(100, 250, 300, 100), (0, 0, 0), text="Play")
		self.button2 = Button(self.surface, pygame.Rect(100, 360, 300, 100), (0, 0, 0), text="Quit")

		self._score()

	def _score(self):
		global high_score

		if not os.path.isfile("HighScore.txt"):
			with open("HighScore.txt", "w") as w:
				w.write("0")
		else:
			with open("HighScore.txt", "r") as r:
				try:
					high_score = int(r.read())
				except:
					pass

	def _events(self):
		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				self.running = False
				pygame.quit()
				quit()

	def draw(self):

		while self.running:
			self.surface.fill(pygame.Color("lightblue"))

			self._events()

			self.text.draw("Match it", 180, 100)
			self.text2.draw(f"Highscore: {high_score}", 180, 500)

			self.button1.draw()
			if self.button1.is_clicked():
				self.running = False
				game = Game(width, height, screen)
				game.main_loop()

			self.button2.draw()
			if self.button2.is_clicked():
				self.running = False
				pygame.quit()
				quit()

			pygame.display.update()


class RetryMenu:
	"""Death menu class"""
	def __init__(self, surface):
		self.surface = surface
		self.running = True

		self.text = Text(32, (0, 0, 0), self.surface)
		self.button1 = Button(self.surface, pygame.Rect(100, 250, 300, 100), (0, 0, 0), text="Retry")
		self.button2 = Button(self.surface, pygame.Rect(100, 450, 300, 100), (0, 0, 0), text="Menu")

	def _events(self):
		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				self.running = False
				pygame.quit()
				quit()

	def draw(self, score):

		while self.running:
			self.surface.fill(pygame.Color("lightblue"))

			self._events()
			check_score(score)

			self.text.draw(f"SCORE: {score}", 180, 200)

			self.button1.draw()
			if self.button1.is_clicked():
				self.running = False
				game = Game(width, height, screen)
				game.main_loop()

			self.button2.draw()
			if self.button2.is_clicked():
				self.running = False
				menu = Menu(self.surface)
				menu.draw()

			pygame.display.update()


class Game:
	""" Main game class """
	def __init__(self, width, height, screen):
		self.width = width
		self.height = height
		self.screen = screen

		self.running = True
		self.clock = pygame.time.Clock()
		self.FPS = 60

		self.player = Entity(pygame.Rect(int((self.width/2)-(25/2)), 500, 50, 50), pygame.Color("red"), self.screen)

		self.obstacle_generator = Map(self.width, self.height, self.screen)

		self.text = Text(25, (0, 0, 0), self.screen)

	def _events(self):
		for event in pygame.event.get():
			if event.type == pygame.QUIT:
				self.running = False
				pygame.quit()
				quit()
			self.player.event(event)

	def main_loop(self):
		while self.running:
			self.clock.tick(self.FPS)
			self.screen.fill(pygame.Color("lightblue"))

			self._events()

			self.player.draw()
			self.obstacle_generator.draw()
			self.text.draw(f"SCORE: {self.obstacle_generator.score}", 20, 20)

			if self.obstacle_generator.check_collision(self.player):
				self.running = False
				self.retry_menu = RetryMenu(self.screen)
				self.retry_menu.draw(self.obstacle_generator.score)

			pygame.display.update()


if __name__ == '__main__':
	pygame.init()

	width = 500
	height = 600
	screen = pygame.display.set_mode((width, height))
	pygame.display.set_caption("Match it!")

	menu = Menu(screen)
	menu.draw()