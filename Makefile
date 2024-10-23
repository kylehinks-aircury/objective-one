# Project directory
DIR = /var/www/connector

NODE_PKG_MANAGER = yarn

# Get the git root directory
GIT_ROOT = $(shell git rev-parse --show-toplevel)

# Apps directories
FRONTEND_DIR = $(GIT_ROOT)/front

# Misc
.DEFAULT_GOAL = help
.PHONY        : help build up start down logs sh composer vendor sf cc test

## —— 🎵 🐳 The Symfony Docker Makefile 🐳 🎵 ——————————————————————————————————

install: ## Install project dependencies
	@cd $(FRONTEND_DIR) && $(NODE_PKG_MANAGER) install

frontend: ## Start frontend development server
	@cd $(FRONTEND_DIR) && $(NODE_PKG_MANAGER) run dev

style-frontend: ## Execute prettier and eslint in frontend
	@cd $(FRONTEND_DIR) && $(NODE_PKG_MANAGER) run style
	@cd $(FRONTEND_DIR) && $(NODE_PKG_MANAGER) tsc --noEmit
