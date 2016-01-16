STAGING_REPO = "ssh://user@hostname/~/staging.example.git"
PROD_REPO = "ssh://user@hostname/~/example.git"

##############  BUILD VARS  ###############

BUILD_DIR := ./build
DOC_ROOT	= /var/www/
APP_NAME	= alpine-sculpin
DIR_PATH = $(DOC_ROOT)$(APP_NAME)

##############  TEST VARS  ###############

SKELETON_BLOG	= https://github.com/sculpin/sculpin-blog-skeleton.git
SCULPIN_INSTALL = sculpin install
SCULPIN_WATCH = sculpin generate --watch --server

############### BUILD RULES ###############

setup:
		virtualenv venv && \
		source venv/bin/activate

install:
    # - Install ansible-galaxy requirements.
		sudo ansible-galaxy install -r requirements.yml --force

# Deploy tasks

prod: build git-prod deploy
		@ git tag -f production
		@ echo "Production deploy complete"

# Build tasks

ans-build:
		# Build the local Sculpin image
		sudo ansible-playbook -i "localhost," -c local playbook.yml --tags install

run:
		# Run rhw local ansible image
		sudo ansible-playbook -i "localhost," -c local -vvvv playbook.yml --tags run

blog:
		# Run rhw local ansible image
		sudo ansible-playbook -i "localhost," -c local playbook.yml --tags blog

delete:
		# Destroy the docker container
		sudo ansible-playbook -i "localhost," -c local playbook.yml --tags delete
		rm -rf build/*

test: clean delete
		# Run serverpec tests
		git clone $(SKELETON_BLOG) build/foo; \
		chown -R timani:timani $(BUILD_DIR)*
		make run

############### DEPLOY TASKS ###############

deploy: clean git-deploy
# Deploy

# Sub-tasks

clean:
	@ rm -rf $(BUILD_DIR)

git-prod:
    @ cd $(BUILD_DIR) && \
    git init && \
    git remote add origin $(PROD_REPO)

git-deploy:
    @ cd $(BUILD_DIR) && \
    git add -A && \
    git commit -m "Release" && \
    git push -f origin +master:refs/heads/master

.PHONY: install prod build run delete test clean deploy git-prod git-deploy prod
