STAGING_REPO = "ssh://user@hostname/~/staging.example.git"
PROD_REPO = "ssh://user@hostname/~/example.git"
LOCAL_PARAMS = -i "localhost," -c local -vvvv
LOCAL_PARAMS = -i hosts -vvvv
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
		if [ $(LOCAL_BUILD) = 1]; then
		fi

requirements:
    # - Install ansible-galaxy requirements.
		ansible-galaxy install -r requirements.txt --force

# Deploy tasks

prod: build git-prod deploy
		@ git tag -f production
		@ echo "Production deploy complete"

# Build tasks

install:
		# Build the local Sculpin image
		ansible-playbook $(LOCAL_PARAMS) playbook.yml --tags install

run:
		# Run rhw local ansible image
		ansible-playbook $(LOCAL_PARAMS) playbook.yml --tags run

test: install
		# Run rhw local ansible image
		ansible-playbook $(LOCAL_PARAMS) playbook.yml --tags test

delete:
		# Destroy the docker container
		ansible-playbook $(LOCAL_PARAMS) playbook.yml --tags delete
		rm -rf build/*

test: install
		# Run serverpec tests
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
