##############  BUILD VARS  ###############

DOC_ROOT	= /var/www/
DIR_PATH	= https://github.com/sculpin/sculpin-blog-skeleton.git
APP_NAME	= alpine-sculpin
DIR_PATH = $(DOC_ROOT)$(APP_NAME)

SCULPIN_INSTALL = sculpin install
SCULPIN_WATCH = sculpin generate --watch --server

############### BUILD RULES ###############

git clone $(DIR_PATH) $(DIR_PATH)
cd $(DIR_PATH)
$(SCULPIN_INSTALL) && $(SCULPIN_WATCH)
